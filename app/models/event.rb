# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  date        :datetime
#  created_at  :datetime
#  updated_at  :datetime
#  duration    :string
#  image       :string
#

class Event < ActiveRecord::Base
  has_many :event_users
  has_many :event_teams
  has_many :users, through: :event_users
  has_many :teams

  validates :title, presence: true
  validates :description, presence: true
  validates :duration, presence: true
  validates :date, presence: true
end
