class User < ApplicationRecord
  rolify
  #User.find_each { |user| User.reset_counters(user.id, :ideas) }
  #User.find_each { |user| User.reset_counters(user.id, :cofounders) }
  #User.find_each { |user| User.reset_counters(user.id, :favorites) }

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:facebook]
  #devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :confirmable, :omniauth_providers => [:facebook]

  include PublicActivity::Model
  tracked only: [:create]
  #tracked

  acts_as_voter
  has_many :ideas, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :cofounders, dependent: :destroy
  has_many :attachments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  #has_many :idea_tags, through: :ideas
  #has_many :tags, through: :idea_tags

  after_create :assign_default_role
  after_update :update_points
  after_touch :update_points
  validates :email, uniqueness: true, if: :email_present

  #def favorite(idea)
  #  favorites.find_or_create_by(idea: idea)
  #end
  #def unfavorite(idea)
  #  favorites.where(idea: idea).destroy_all
  #  favorite = self.favorites.find_by_idea_id(idea.id)
  #  favorite.destroy!
  #
  #  idea.reload
  #end
  #def favorited?(idea)
  #  self.favorites.find_by_idea_id(idea.id)
  #  favorites.find_by(idea_id: idea.id).present?
  #  #idea.favorites.where(user_id: id).any?
  #end

  def to_s
    id
  end

  def email_present
    email.present?
  end

  def assign_default_role
    self.add_role(:member) if self.roles.blank?
  end

  def username
    if name.present?
      name
    elsif email.present?
      self.email.split(/@/).first
    end
  end

  def update_points
    update_column :points, (ideas.count + cofounders.count + votes.count + favorites.count + attachments.count)
    #comments.count + ideas.count * 10 + cofounders.count * 5 + attachments.count * 2 + votes.count + find_voted_items.count
    #comments.count + ideas.count * 10 + cofounders.count * 5 + attachments.count * 2 + votes.count + ideas.get_votes.size
    #includes(:expence).where(expences: {job_id: nil}).where.not(supplier_id: nil).where.not(supplier_price: 0) }
    #.joins(:ideas).where
    #ActsAsVotable::Vote.count
    #votes.count
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    if !where(email: auth.info.email).empty?
      user = where(email: auth.info.email).first
      user.provider = auth.provider # and connect him to facebook here
      user.uid = auth.uid           # and here
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      user.save!
      user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        if auth.info.email.present?
          user.email = auth.info.email
        else
          user.email = "#{auth.uid}@facebook.com"
        end
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   # assuming the user model has a name
        user.image = auth.info.image # assuming the user model has an image
        #user.description = auth.extra.raw_info.bio
      end
    end
  end
end
