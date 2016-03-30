# == Schema Information
#
# Table name: team_users
#
#  id      :integer          not null, primary key
#  team_id :integer
#  user_id :integer
#

class TeamUser < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
end
