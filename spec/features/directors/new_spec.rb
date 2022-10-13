require 'rails_helper'

RSpec.describe 'the Director create page' do 
  it 'links from the director index page' do 
    visit '/directors/'

    click_link('New Director')

    expect(current_path).to eq('/directors/new')
  end

  it 'can create a new director' do 
    visit '/directors/new'
    fill_in('Name', with: 'Ari Aster')
    fill_in('Birth Year', with: '1986')
    fill_in('Birth Place', with: 'New York City, New York')
    check('Still Active?')

    click_button('Create Director')

    expect(current_path).to eq('/directors')
    expect(page).to have_content('Ari Aster')
    aster = Director.last
    expect(aster.birth_year).to eq(1986)
    expect(aster.birth_place).to eq('New York City, New York')
    expect(aster.still_active).to eq(true)
  end

  it 'works with other params' do 
    visit '/directors/new'
    fill_in('Name', with: 'Alfred Hitchcock')
    fill_in('Birth Year', with: '1899')
    fill_in('Birth Place', with: 'Essex, England')
    
    click_button('Create Director')
    hitchcock = Director.last

    expect(hitchcock.birth_year).to eq(1899)
    expect(hitchcock.birth_place).to eq('Essex, England')
    expect(hitchcock.still_active).to eq(false)
  end
end