class Comment < ApplicationRecord
  belongs_to :idea
  belongs_to :user
  validates :user_id, :idea_id, :body, presence: :true
  validates :body, length: {minimum: 1, maximum: 5000}
  def to_s
    body
  end
end
