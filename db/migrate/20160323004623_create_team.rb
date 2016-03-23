class CreateTeam < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :event
      t.integer :admin_id
      t.string :status, default: 'closed'
      t.string :name
    end

    add_index :teams, :admin_id
  end
end
