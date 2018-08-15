class Tag < ApplicationRecord
  has_many :idea_tags, inverse_of: :tag, dependent: :destroy
  has_many :ideas, through: :idea_tags
  validates :name, length: {minimum: 1, maximum: 25}, uniqueness: true
  #default_scope { order(idea_tags_count: :desc) }
  def to_s
    name
  end
  def popular_name
    "#{name.to_s}: #{idea_tags_count.to_s}"
  end
end
