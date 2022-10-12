require 'rails_helper'

RSpec.describe 'the directors movies index' do 
  before(:each) do 
    @kubrick = Director.create!(name: 'Stanley Kubrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: false)
    @shining = @kubrick.movies.create!(name: 'The Shining', release_year: 1980, mpaa_rating: 'R', run_time: 146, rotten_tomatoes_score: 82, oscar_winner: false)
    @space = @kubrick.movies.create!(name: '2001: A Space Odyssey', release_year: 1968, mpaa_rating: 'G', run_time: 159, rotten_tomatoes_score: 92, oscar_winner: true)
  end

  # User Story 5, Parent Children Index 
  it 'displays the directors name' do 
    visit "/directors/#{@kubrick.id}/movies"

    expect(page).to have_content(@kubrick.name)
  end

  it 'displays all of the movies from that director' do 
    visit "/directors/#{@kubrick.id}/movies"

    expect(page).to have_content(@shining.name)
    expect(page).to have_content(@space.name)
  end

  it 'shows the movies attribiutes' do 
    visit "/directors/#{@kubrick.id}/movies"

    expect(page).to have_content(@shining.release_year)
    expect(page).to have_content(@shining.mpaa_rating)
    expect(page).to have_content("#{@shining.run_time} mins")
    expect(page).to have_content("Rotten Tomatoes Score: #{@shining.rotten_tomatoes_score}%")
    expect(page).to have_content("Oscar Winner?: #{@shining.oscar_winner}")
  end
end
