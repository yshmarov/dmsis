class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :idea, counter_cache: true
end