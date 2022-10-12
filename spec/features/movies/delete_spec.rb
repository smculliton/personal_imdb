require 'rails_helper'

RSpec.describe 'the Movie delete function' do
# User Story 20, Child Delete 

# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child
  before(:each) do 
    @kubrick = Director.create!(name: 'Stanley Kubrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: false)
    @space = @kubrick.movies.create!(name: '2001: A Space Odyssey', release_year: 1968, mpaa_rating: 'G', run_time: 159, rotten_tomatoes_score: 92, oscar_winner: true)
  end
  it 'links from movie show page and deletes movie' do 
    visit "/movies/#{@space.id}"

    click_button "Delete #{@space.name}"

    expect(current_path).to eq('/movies')
    expect(page).to_not have_content(@space.name)
  end
end