class RemoteCofounders < ActiveRecord::Migration[5.2]
  def change
    drop_table :cofounders
  end
end
