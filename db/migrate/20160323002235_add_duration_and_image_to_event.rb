class AddDurationAndImageToEvent < ActiveRecord::Migration
  def change
    add_column :events, :duration, :string
    add_column :events, :image, :string
  end
end
