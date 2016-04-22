require 'rails_helper'

RSpec.feature 'Application Header' do
  let(:locale_params) { { locale: :en } }

  describe 'locale toggle' do
    let(:button_attribute) { "a[data-redirect-to='locale-toggle']" }

    before do
      I18n.locale = :en
    end

    it 'has button to toggle locale' do
      visit root_path
      expect(page).to have_css(button_attribute)
    end

    it 'changes the locale of the page' do
      visit root_path

      button = page.find(button_attribute)
      button.click
      expect(I18n.locale).to eq(:fr)
    end

    it 'can toggle multiple times' do
      visit root_path

      button = page.find(button_attribute)
      button.click
      expect(I18n.locale).to eq(:fr)

      button = page.find(button_attribute)
      button.click
      expect(I18n.locale).to eq(:en)
    end

    # FIXME(cab): This is the behavior we want, but we can't get this to work
    it 'changes the URL of the page that reflects the locale' do
      visit root_path(locale_params)

      button = page.find(button_attribute)
      button.click
      expect(current_path).to match(/(\/en)/)

      button = page.find(button_attribute)
      button.click
      expect(current_path).to match(/(\/fr)/)
    end
  end

  describe 'brand button' do
    let(:button_attribute) { '.navbar-brand' }

    it 'has button to redirect to the homepage' do
      visit root_path
      expect(page).to have_css(button_attribute)
    end

    it 'redirects to the homepage when clicking the button' do
      visit events_path

      button = page.find(button_attribute)
      button.click
      expect(current_path).to eq(root_path(locale_params))
    end
  end

  describe 'home button' do
    let(:button_attribute) { "a[data-redirect-to='homepage']" }

    it 'has button to redirect to the homepage' do
      visit root_path

      expect(page).to have_css(button_attribute)
    end

    it 'redirects to the homepage when clicking the button' do
      visit events_path

      button = page.find(button_attribute)
      button.click
      expect(current_path).to eq(root_path(locale_params))
    end
  end

  describe 'event button' do
    let(:button_attribute) { "a[data-redirect-to='events']" }

    it 'has button to redirect to the events' do
      visit root_path

      expect(page).to have_css(button_attribute)
    end

    it 'redirects to the events when clicking the button' do
      visit root_path

      button = page.find(button_attribute)
      button.click
      expect(current_path).to eq(events_path(locale_params))
    end
  end
end
