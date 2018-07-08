class AddFavoritesCountToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :favorites_count, :integer
  end
end
