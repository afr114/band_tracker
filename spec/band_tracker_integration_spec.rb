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

  it 'can update the band name' do
    @band = Band.create({name: "Great New Band"})
    visit '/bands'
    click_link "#{@band.name}"
    click_link 'Update Band'
    fill_in 'name', with: 'Corndog'
    click_button 'Submit'
    expect(page).to have_content 'Corndog'
  end


  it 'will remove a band' do
    @band = Band.create({name: "Great New Band"})
    visit '/bands'
    click_button 'Delete'
    expect(page).not_to have_content 'Great New Band'
  end
end
