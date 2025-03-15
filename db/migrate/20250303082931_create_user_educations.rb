class CreateUserEducations < ActiveRecord::Migration[7.1]
  def change
    create_table :user_educations do |t|
          t.references :education
          t.references :user
          t.float :grade,null:false
          t.timestamps
    end
  end
end
