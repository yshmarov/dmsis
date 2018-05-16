class ChangeCommentBodyTypeFromStringToText < ActiveRecord::Migration[5.2]
  def up
    change_column :comments, :body, :text
  end
  def down
    change_column :comments, :body, :string
  end
end
