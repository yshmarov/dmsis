class Idea < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :user_id, :name, :description, presence: :true
  acts_as_votable
end
