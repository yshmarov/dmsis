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

  def positive_percent
    unless total_score == 0
      positive_score/total_score*100
    end
  end

  def negative_percent
    unless total_score == 0
      negative_score/total_score*100
    end
  end

end
