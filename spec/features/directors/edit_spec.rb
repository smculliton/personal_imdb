require 'rails_helper'

RSpec.describe 'the Director edit page' do 
# User Story 12, Parent Update 

# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

  before(:each) do 
    @kubrick = Director.create!(name: 'Stunley Karbrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: false)
  end

  it 'links from the directors show page' do 
    visit "/directors/#{@kubrick.id}"

    click_link "Update Director"

    expect(current_path).to eq("/directors/#{@kubrick.id}/edit")
  end

  it 'can edit the directors page' do
    visit "/directors/#{@kubrick.id}/edit"

    fill_in('Name', with: 'Stanley Kubrick')
    
    click_button('Update Director')

    expect(current_path).to eq("/directors/#{@kubrick.id}")
    expect(page).to have_content('Stanley Kubrick')
    expect(page).to_not have_content('Stunley Karbrick')
  end
end