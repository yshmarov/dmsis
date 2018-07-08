class AddIdeaTagsCountToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :idea_tags_count, :integer 
  end
end
