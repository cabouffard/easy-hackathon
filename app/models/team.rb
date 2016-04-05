# == Schema Information
#
# Table name: teams
#
#  id            :integer          not null, primary key
#  event_id      :integer
#  admin_id      :integer
#  status        :string           default("closed")
#  name          :string
#  team_users_id :integer
#

class Team < ActiveRecord::Base
  belongs_to :event

  has_many :team_users
  belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'
  has_many :users, through: :team_users

  validates :name, presence: true

  def admin?(user)
    admin == user
  end
end
