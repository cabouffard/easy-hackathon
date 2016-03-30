class CreateTeamUser < ActiveRecord::Migration
  def change
    create_table :team_users do |t|
      t.references :team
      t.references :user
    end

    add_index :team_users, [:team_id, :user_id]
  end
end
