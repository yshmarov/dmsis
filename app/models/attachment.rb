class Attachment < ApplicationRecord
  belongs_to :user
  belongs_to :idea
  validates :user_id, :idea_id, :title, :url, presence: :true
  def to_s
    title
  end
end
