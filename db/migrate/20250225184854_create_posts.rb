class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :user
      t.string :desciption
      t.timestamps
    end
  end
end
