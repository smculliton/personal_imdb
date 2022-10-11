require 'rails_helper'  

  
RSpec.describe 'the directors show page' do 
  before(:each) do 
    @kubrick = Director.create!(name: 'Stanley Kubrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: false)
    @hitchcock = Director.create!(name: 'Alfred Hitchcock', birth_year: 1899, birth_place: 'Essex, England', still_active: false)

    @shining = @kubrick.movies.create!(name: 'The Shining', release_year: 1980, mpaa_rating: 'R', run_time: 146, rotten_tomatoes_score: 82, oscar_winner: false)
    @space = @kubrick.movies.create!(name: '2001: A Space Odyssey', release_year: 1968, mpaa_rating: 'G', run_time: 159, rotten_tomatoes_score: 92, oscar_winner: true)
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
    visit "/directors/#{@hitchcock.id}"
    
    expect(page).to have_content(@hitchcock.name)
    expect(page).to have_content(@hitchcock.birth_year)
    expect(page).to have_content(@hitchcock.birth_place)
    expect(page).to have_content("Still Active?: #{@hitchcock.still_active}")      
  end

  # User Story 7, Parent Child Count
  it 'displays count of movies associated with director' do 
    visit "/directors/#{@kubrick.id}"

    expect(page).to have_content("Movie Count: 2")

    @kubrick.movies.create!(name: 'A Clockwork Orange', release_year: 1971, mpaa_rating: 'X', run_time: 136, rotten_tomatoes_score: 88, oscar_winner: false)
    visit "/directors/#{@kubrick.id}"

    expect(page).to have_content("Movie Count: 3")
  end
end