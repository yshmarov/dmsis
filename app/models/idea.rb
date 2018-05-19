class Idea < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :cofounders
  has_many :idea_tags, inverse_of: :idea
  has_many :tags, through: :idea_tags
  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :idea_tags, allow_destroy: true
  validates :user_id, :name, :description, presence: :true
  acts_as_votable

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
