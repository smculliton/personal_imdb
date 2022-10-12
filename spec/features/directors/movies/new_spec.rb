require 'rails_helper'

RSpec.describe 'the Director-Movie creation page' do 
# User Story 13, Parent Child Creation 

# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

  before(:each) do 
    @kubrick = Director.create!(name: 'Stanley Kubrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: false)
  end

  it 'links from the director-movie index page' do 
    visit "/directors/#{@kubrick.id}/movies"

    click_link 'Create Movie'

    expect(current_path).to eq("/directors/#{@kubrick.id}/movies/new")
  end

  it 'can create a new movie related to a director'

end