class ChnageColumnNameInPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts,:desciption,:description
  end
end
