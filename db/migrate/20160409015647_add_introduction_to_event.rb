class AddIntroductionToEvent < ActiveRecord::Migration
  def change
    add_column :events, :introduction, :text
  end
end
