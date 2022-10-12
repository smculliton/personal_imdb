require 'rails_helper'

RSpec.describe 'the Director delete page' do 
# User Story 19, Parent Delete 

# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent
  before(:each) do 
    @kubrick = Director.create!(name: 'Stanley Kubrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: false)
  end
  it 'links from the director show page and deletes director' do 
    visit "/directors/#{@kubrick.id}"

    click_button "Delete"

    expect(current_path).to eq('/directors')
    expect(page).to_not have_content(@kubrick.name)
  end
end