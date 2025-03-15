class CreateEducations < ActiveRecord::Migration[7.1]
  def change
    create_table :educations do |t|
       t.string :degree
       t.string :field_of_study
      t.timestamps
    end
  end
end
