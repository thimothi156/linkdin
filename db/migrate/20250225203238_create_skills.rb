class CreateSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :skills do |t|
       t.string :name,index:true
      t.timestamps
    end
  end
end
