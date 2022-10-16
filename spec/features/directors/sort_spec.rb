require 'rails_helper' 

RSpec.describe 'the sorted index page' do 
  # Extension 1: Sort Parents by Number of Children 

  # As a visitor
  # When I visit the Parents Index Page
  # Then I see a link to sort parents by the number of `child_table_name` they have
  # When I click on the link
  # I'm taken back to the Parent Index Page where I see all of the parents in order of their count of `child_table_name` (highest to lowest) And, I see the number of children next to each parent name

  before(:each) do 
    @hitchcock = Director.create!(name: 'Alfred Hitchcock', birth_year: 1899, birth_place: 'Essex, England', still_active: false)
    @kubrick = Director.create!(name: 'Stanley Kubrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: false)
    @craven = Director.create!(name: 'Wes Craven', birth_year: 1939, birth_place: 'Cleveland, Ohio', still_active: false)

    @shining = @kubrick.movies.create!(name: 'The Shining', release_year: 1980, mpaa_rating: 'R', run_time: 146, rotten_tomatoes_score: 82, oscar_winner: false)
    @space = @kubrick.movies.create!(name: '2001: A Space Odyssey', release_year: 1968, mpaa_rating: 'G', run_time: 159, rotten_tomatoes_score: 92, oscar_winner: true)
    @birds = @hitchcock.movies.create!(name: 'The Birds', release_year: '1963', mpaa_rating: 'PG-13', run_time: 119, rotten_tomatoes_score: 93, oscar_winner: false) 
  end

  it 'has a link on the parents index page' do 
    visit '/directors/'

    click_link "Sort Directors by Movie Count"

    expect(current_path).to eq('/directors/sort')
  end

  it 'sorts directors by count of movies' do 
    visit '/directors/sort/'

    expect(page.body).to match(/#{@kubrick.name}.*#{@hitchcock.name}.*#{@craven.name}/m)
  end

  it 'shows count of movies next to each director' do 
    visit '/directors/sort/'

    expect(page).to have_content('Stanley Kubrick - Movies: 2')
    expect(page).to have_content('Alfred Hitchcock - Movies: 1')
  end
end