class AddPublishedAtToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :published_at, :datetime, default: nil
  end
end
