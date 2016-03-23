# == Schema Information
#
# Table name: teams
#
#  id       :integer          not null, primary key
#  event_id :integer
#  admin_id :integer
#  status   :string           default("closed")
#  name     :string
#

class Team < ActiveRecord::Base
  belongs_to :event

  validates :name, presence: true
end
