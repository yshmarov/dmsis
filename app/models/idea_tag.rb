class IdeaTag < ApplicationRecord
  belongs_to :tag, counter_cache: true
  belongs_to :idea
  accepts_nested_attributes_for :tag, reject_if: :all_blank
end
