class User < ApplicationRecord
  rolify

  #devise :database_authenticatable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  #devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  acts_as_voter

  def points
    #comments.count + ideas.count * 10 + cofounders.count * 5 + attachments.count * 2 + votes.count + find_voted_items.count
    #comments.count + ideas.count * 10 + cofounders.count * 5 + attachments.count * 2 + votes.count + ideas.get_votes.size
    comments.count + ideas.count * 10 + cofounders.count * 5 + attachments.count * 2 + votes.count
    #includes(:expence).where(expences: {job_id: nil}).where.not(supplier_id: nil).where.not(supplier_price: 0) }
    #.joins(:ideas).where
    #ActsAsVotable::Vote.count
    #votes.count
  end

  def to_s
    id
  end

  validates :email, uniqueness: true, if: :email_present

  def email_present
    email.present?
  end

  has_many :ideas, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :cofounders, dependent: :destroy
  has_many :attachments, dependent: :destroy

  #has_many :idea_tags, through: :ideas
  #has_many :tags, through: :idea_tags

  after_create :assign_default_role

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

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  #if the user is new
  #def self.from_omniauth(auth)
  #  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #    user.email = auth.info.email
  #    user.password = Devise.friendly_token[0,20]
  #    user.name = auth.info.name   # assuming the user model has a name
  #    user.image = auth.info.image # assuming the user model has an image
  #    #user.description = auth.extra.raw_info.bio
  #  end
  #end

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
  ### if user signed in with an email and wants to add FB
  
  #def self.from_omniauth(auth)
  #  where(auth.info.slice(:email)).first_or_create do |user|
  #    user.email = auth.info.email
  #    user.password = Devise.friendly_token[0,20]
  #    user.name = auth.info.name
  #    user.image = auth.info.image # assuming the user model has an image
  #  end
  #end
end
