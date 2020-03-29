class Attachment < ApplicationRecord
  belongs_to :user, touch: true
  belongs_to :idea, counter_cache: true
  validates :user_id, :idea_id, :title, :url, presence: :true
  def to_s
    title
  end
end
