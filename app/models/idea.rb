class Idea < ApplicationRecord
  belongs_to :user
  validates :user_id, :name, :description, presence: :true
end
