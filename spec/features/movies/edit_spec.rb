require 'rails_helper'

RSpec.describe 'the Movie edit page' do 
# User Story 14, Child Update 
  before(:each) do 
    @kubrick = Director.create!(name: 'Stanley Kubrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: false)
    @shining = @kubrick.movies.create!(name: 'The Shinting', release_year: 2090, mpaa_rating: 'R', run_time: 146, rotten_tomatoes_score: 82, oscar_winner: false)
  end

  it 'links from the movie show page' do
    visit "/movies/#{@shining.id}"

    click_button "Update Movie"

    expect(current_path).to eq("/movies/#{@shining.id}/edit")
  end

  it 'can edit a movie' do 
    visit "/movies/#{@shining.id}/edit"

    fill_in('Name', with: 'The Shining')
    fill_in('Release Year', with: '1980')
    check('Oscar Winner?')

    click_button "Update Movie"
    shining = Movie.last

    expect(current_path).to eq("/movies/#{@shining.id}")
    expect(page).to have_content('The Shining')
    expect(page).to have_content('1980')
    expect(page).to have_content("Rotten Tomatoes Score: #{@shining.rotten_tomatoes_score}%")
    expect(shining.oscar_winner).to eq(true)
  end
end