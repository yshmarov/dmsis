class Idea < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :attachments, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :cofounders, dependent: :destroy
  has_many :idea_tags, inverse_of: :idea, dependent: :destroy
  has_many :tags, through: :idea_tags
  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :idea_tags, allow_destroy: true
  acts_as_votable

  validates :user_id, :name, :description, presence: :true
  validates :name, length: {minimum: 2, maximum: 250}, uniqueness: true
  validates :description, length: {minimum: 2, maximum: 10000}, uniqueness: true

  def positive_score
    self.get_upvotes.size
  end	
    
  def negative_score
    self.get_downvotes.size
  end	

  def total_score
    positive_score - negative_score
  end

  def total_votes
    positive_score + negative_score
  end

  def positive_percent
    positive_score.to_d/total_votes.to_d*100
  end

  def negative_percent
    negative_score.to_d/total_votes.to_d*100
  end

  def associations?
    votes_for.size > 0 || comments.any? || cofounders.any?
  end

  private

  def check_for_associations
    if associations?
      errors[:base] << "cannot delete"
      false
    end
  end
end
