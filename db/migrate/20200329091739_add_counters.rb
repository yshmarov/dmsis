class AddCounters < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :cofounders_count, :integer, :null => false, :default => 0
    add_column :ideas, :attachments_count, :integer, :null => false, :default => 0
  end
end
