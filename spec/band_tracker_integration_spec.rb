require 'spec_helper'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'band_tracker path', { type: :feature } do
  it 'can create a new band' do
    visit '/'
    click_link "Find Your Favorite Band"
    fill_in 'name', with: 'Great New Band'
    click_button 'Submit'
    expect(page).to have_content 'Great New Band'
  end
end
