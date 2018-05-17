class IdeaTag < ApplicationRecord
  belongs_to :tag
  belongs_to :idea
  accepts_nested_attributes_for :tag, reject_if: :all_blank
end
