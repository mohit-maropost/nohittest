class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name,      null: false
      t.integer :owner_id, null: false
      t.timestamps null: false
    end
    # add_index :accounts, [:owner_id], :name => 'my_index'
    add_index :accounts, [:name, :owner_id], :unique => true
  end
end
