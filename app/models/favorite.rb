class Favorite < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :idea, counter_cache: true
  #Idea.find_each { |idea| Idea.reset_counters(idea.id, :favorites) }
  validates :user_id, uniqueness: { scope: :idea_id }
end