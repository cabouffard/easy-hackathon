require 'rails_helper'

RSpec.describe Event do
  let(:event) { create(:event) }

  describe 'factories' do
    it 'has a valid factory' do
      result = event.valid?
      expected_result = true

      expect(result).to eq(expected_result)
    end
  end
end
