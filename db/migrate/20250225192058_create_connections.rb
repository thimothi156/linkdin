class CreateConnections < ActiveRecord::Migration[7.1]
  def change
    create_table :connections do |t|
       t.references :user,foreign_key:true
       t.references :connected_user,foreign_key:{to_table: :users}
       t.integer :status,default:0
      t.timestamps
    end
  end
end
