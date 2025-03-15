class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :user,foreign_key:true
      t.references :likeable, polymorphic: true
      t.timestamps
    end
  end
end
