require 'rails_helper'

RSpec.describe 'the Director create page' do 
# User Story 11, Parent Creation 

# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

  it 'links from the director index page' do 
    visit '/directors/'

    click_link('New Director')

    expect(current_path).to eq('/directors/new')
  end

  it 'can create a new director' do 
    visit '/directors/new'
    fill_in('Name', with: 'Ari Aster')
    fill_in('Birth Year', with: '1986')
    fill_in('Birth Place', with: 'New York City, New York')
    fill_in('Still Active', with: 'true')
    # check('Still Active')

    click_button('Create Director')

    expect(current_path).to eq('/directors')
    expect(page).to have_content('Ari Aster')
    # expect(page).to have_content('1986')
    # expect(page).to have_content('New York City, New York')
    # expect(page).to have_content('Still Active: true')
  end
end