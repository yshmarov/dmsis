class Cofounder < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :idea
  belongs_to :user
  validates :user_id, :idea_id, :role, :location, presence: :true
  ##if client ID is validated, he can have only 1 wish. If not - can be 2 times in 1 course, that is wrong.
  validates_uniqueness_of :user_id, :scope => :idea_id
  validates :role, length: {minimum: 2, maximum: 250}
  validates :location, length: {minimum: 2, maximum: 50}

  def to_s
    role
  end
end
