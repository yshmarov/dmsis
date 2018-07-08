class IdeaTag < ApplicationRecord
  belongs_to :tag, counter_cache: true
  #Tag.find_each { |tag| Tag.reset_counters(tag.id, :idea_tags) }
  belongs_to :idea
  accepts_nested_attributes_for :tag, reject_if: :all_blank
end
