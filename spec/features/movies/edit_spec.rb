require 'rails_helper'

RSpec.describe 'the Movie edit page' do 
# User Story 14, Child Update 

# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
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

    click_button "Update Movie"

    expect(current_path).to eq("/movies/#{@shining.id}")
    expect(page).to have_content('The Shining')
    expect(page).to have_content('1980')
    expect(page).to have_content("Rotten Tomatoes Score: #{@shining.rotten_tomatoes_score}%")
  end
end