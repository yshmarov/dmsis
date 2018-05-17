class CreateIdeaTags < ActiveRecord::Migration[5.2]
  def change
    create_table :idea_tags do |t|
      t.belongs_to :tag, foreign_key: true
      t.belongs_to :idea, foreign_key: true

      t.timestamps
    end
  end
end
