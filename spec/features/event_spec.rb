require 'rails_helper'

RSpec.feature 'Event Page' do
  describe '#new' do
    it 'has all the fields to create an event' do
      visit new_event_path
      expect(page).to have_css('div.event_title')
      expect(page).to have_css('div.event_description')
      expect(page).to have_css('div.event_introduction')
      expect(page).to have_css('div.event_duration')
      expect(page).to have_css('div.event_date')
    end
  end
end
