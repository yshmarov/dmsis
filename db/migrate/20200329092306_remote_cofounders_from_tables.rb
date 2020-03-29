class RemoteCofoundersFromTables < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :cofounders_count
    remove_column :ideas, :cofounders_count
  end
end
