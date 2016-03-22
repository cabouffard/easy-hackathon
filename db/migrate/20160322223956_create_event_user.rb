class CreateEventUser < ActiveRecord::Migration
  def change
    create_table :event_users do |t|
      t.references :user
      t.references :event
    end

    add_index :event_users, [:user_id, :event_id]
  end
end
