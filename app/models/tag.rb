class Tag < ApplicationRecord
  has_many :idea_tags, inverse_of: :tag, dependent: :destroy
  has_many :ideas, through: :idea_tags
  validates :name, length: {minimum: 1, maximum: 25}, uniqueness: true
  def to_s
    name
  end
  def popular_name
    "#{name.to_s} #{idea_tags.count.to_s}"
  end
end
