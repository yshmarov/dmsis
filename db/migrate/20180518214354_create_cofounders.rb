class CreateCofounders < ActiveRecord::Migration[5.2]
  def change
    create_table :cofounders do |t|
      t.string :role
      t.string :location
      t.references :user, foreign_key: true
      t.references :idea, foreign_key: true

      t.timestamps
    end
  end
end
