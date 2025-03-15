class CreateUserSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :user_skills do |t|
      t.references :user,foreign_key:true
      t.references :skill,foreign_key:true
      t.timestamps
    end
  end
end
