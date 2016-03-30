class AddTeamAssociations < ActiveRecord::Migration
  def change
    add_column :teams, :team_users_id, :integer
    add_index :teams, :team_users_id
  end
end
