class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :account_id
      t.integer :user_id
      t.string :email
      t.string :token
      t.timestamps null: false
    end
    add_index :invites, [:accounts_id, :email]
    add_index :invites, [:accounts_id, :email], unique:true, name: "accounts_id_email"
  end
end
