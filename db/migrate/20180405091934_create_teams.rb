class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :account_id
      t.integer :team_id
      t.timestamps null: false
    end
  end
end
