class Cofounder < ApplicationRecord
  belongs_to :idea
  belongs_to :user
  validates :user_id, :idea_id, :role, :location, presence: :true
  def to_s
    role
  end
end
