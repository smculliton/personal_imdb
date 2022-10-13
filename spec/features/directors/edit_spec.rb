require 'rails_helper'

RSpec.describe 'the Director edit page' do 
# User Story 12, Parent Update 

  before(:each) do 
    @kubrick = Director.create!(name: 'Stunley Karbrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: true)
  end

  it 'links from the directors show page' do 
    visit "/directors/#{@kubrick.id}"
    
    click_button "Update Director"

    expect(current_path).to eq("/directors/#{@kubrick.id}/edit")
  end

  it 'can edit the directors page' do
    visit "/directors/#{@kubrick.id}/edit"
    
    fill_in('Name', with: 'Stanley Kubrick')
    uncheck('Still Active?')
    
    click_button('Update Director')
    kubrick = Director.last

    expect(current_path).to eq("/directors/#{@kubrick.id}")
    expect(page).to have_content('Stanley Kubrick')
    expect(page).to_not have_content('Stunley Karbrick')
    expect(kubrick.still_active).to eq(false)
  end
end