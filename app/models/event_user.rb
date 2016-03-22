class EventUser < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  # Validate that only one user exists for each events
  validates_uniqueness_of :event_id, scope: :user_id, message: 'You can\'t subscribe to same event multiple times'
end
