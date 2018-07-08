class AddStatsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ideas_count, :integer
    add_column :users, :cofounders_count, :integer
    add_column :users, :favorites_count, :integer
    add_column :users, :points, :integer
  end
end
