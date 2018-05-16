class Comment < ApplicationRecord
  belongs_to :idea
  belongs_to :user
  validates :user_id, :idea_id, :body, presence: :true
  def to_s
    body
  end
end
