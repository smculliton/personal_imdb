require 'rails_helper'  

  
RSpec.describe 'the directors show page' do 
  before(:each) do 
    @kubrick = Director.create!(name: 'Stanley Kubrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: false)
    @hitchcock = Director.create!(name: 'Alfred Hitchcock', birth_year: 1899, birth_place: 'Essex, England', still_active: false)
  end

  # User Story 2, Parent Show 
  it 'shows the name of the director, and their associated attributes' do 
    visit "directors/#{@kubrick.id}"

    expect(page).to have_content(@kubrick.name)
    expect(page).to have_content(@kubrick.birth_year)
    expect(page).to have_content(@kubrick.birth_place)
    expect(page).to have_content("Still Active?: #{@kubrick.still_active}")      
  end

  it 'works with another director' do 
    visit "directors/#{@hitchcock.id}"
    
    expect(page).to have_content(@hitchcock.name)
    expect(page).to have_content(@hitchcock.birth_year)
    expect(page).to have_content(@hitchcock.birth_place)
    expect(page).to have_content("Still Active?: #{@hitchcock.still_active}")      
  end
end