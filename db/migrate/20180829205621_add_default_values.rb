class AddDefaultValues < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :ideas_count
    remove_column :users, :cofounders_count
    remove_column :users, :favorites_count
    remove_column :users, :points
    remove_column :tags, :idea_tags_count
    remove_column :ideas, :favorites_count
    add_column :users, :ideas_count, :integer, :null => false, :default => 0
    add_column :users, :cofounders_count, :integer, :null => false, :default => 0
    add_column :users, :favorites_count, :integer, :null => false, :default => 0
    add_column :users, :points, :integer, :null => false, :default => 0
    add_column :tags, :idea_tags_count, :integer, :null => false, :default => 0
    add_column :ideas, :favorites_count, :integer, :null => false, :default => 0
  end
end
