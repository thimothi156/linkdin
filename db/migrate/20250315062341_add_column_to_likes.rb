class AddColumnToLikes < ActiveRecord::Migration[7.1]
  def change
    add_column :likes,:type,:integer
  end
end
