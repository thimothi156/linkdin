class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email 
      t.string :phone_number 
      t.string :password_digest 
      t.string :first_name 
      t.string :last_name
      t.timestamps
    end
  end
end
