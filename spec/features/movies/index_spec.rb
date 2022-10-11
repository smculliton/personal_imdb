require 'rails_helper'

RSpec.describe 'the movie index' do 
  before(:each) do 
    @kubrick = Director.create!(name: 'Stanley Kubrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: false)
    @shining = @kubrick.movies.create!(name: 'The Shining', release_year: 1980, mpaa_rating: 'R', run_time: 146, rotten_tomatoes_score: 82, oscar_winner: false)
    @space = @kubrick.movies.create!(name: '2001: A Space Odyssey', release_year: 1968, mpaa_rating: 'G', run_time: 159, rotten_tomatoes_score: 92, oscar_winner: true)
  end

  # User Story 3, Child Index 
  it 'displays the movie titles' do 
    visit "/movies/"

    expect(page).to have_content(@shining.name)
    expect(page).to have_content(@space.name)
  end 

  it 'displays the movie attributes' do 
    visit "/movies"

    expect(page).to have_content(@shining.release_year)
    expect(page).to have_content(@shining.mpaa_rating)
    expect(page).to have_content("#{@shining.run_time} mins")
    expect(page).to have_content("Rotten Tomatoes Score: #{@shining.rotten_tomatoes_score}%")
    expect(page).to have_content("Oscar Winner?: #{@shining.oscar_winner}")
  end

  it 'displays all movie attributes' do 
    visit "/movies/"

    expect(page).to have_content(@space.release_year)
    expect(page).to have_content(@space.mpaa_rating)
    expect(page).to have_content("#{@space.run_time} mins")
    expect(page).to have_content("Rotten Tomatoes Score: #{@space.rotten_tomatoes_score}%")
    expect(page).to have_content("Oscar Winner?: #{@space.oscar_winner}")
  end
end