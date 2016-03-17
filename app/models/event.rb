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
#

class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
end
