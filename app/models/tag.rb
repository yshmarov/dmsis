class Tag < ApplicationRecord
  has_many :idea_tags, inverse_of: :tag
  has_many :ideas, through: :idea_tags
  validates :name, length: {minimum: 1, maximum: 25}, uniqueness: true
  def to_s
    name
  end
end
