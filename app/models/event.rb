# == Schema Information
#
# Table name: events
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  date         :datetime
#  created_at   :datetime
#  updated_at   :datetime
#  duration     :string
#  image        :string
#  introduction :text
#

class Event < ActiveRecord::Base
  has_many :event_users
  has_many :users, through: :event_users
  has_many :teams

  validates :title, presence: true
  validates :introduction, presence: true
  validates :description, presence: true
  validates :duration, presence: true
  validates :date, presence: true

  def participant_count
    users.count
  end

  def team_count
    teams.count
  end
end
