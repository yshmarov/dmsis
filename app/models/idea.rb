class Idea < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :user_id, :name, :description, presence: :true
  acts_as_votable
  def total_score
    positive_score - negative_score
  end
  def positive_score
    self.get_upvotes.size
  end	
  def negative_score
    self.get_downvotes.size
  end	
end
