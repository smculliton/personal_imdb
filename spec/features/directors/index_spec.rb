require 'rails_helper' 

RSpec.describe 'the Director index' do 
  before(:each) do 
    @kubrick = Director.create!(name: 'Stanley Kubrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: false)
    @hitchcock = Director.create!(name: 'Alfred Hitchcock', birth_year: 1899, birth_place: 'Essex, England', still_active: false)
    @craven = Director.create!(name: 'Wes Craven', birth_year: 1939, birth_place: 'Cleveland, Ohio', still_active: false, created_at: DateTime.new(1991,3,13,4,5,6))
  end

  # User Story 1, Parent Index
  xit 'has the name of every director' do
    visit "/directors/"

    expect(page).to have_content(@kubrick.name)
    expect(page).to have_content(@hitchcock.name)
  end

  # User Story 6, Parent Index sorted by Most Recently Created
  xit 'is sorted by most recently created' do 
    visit "/directors/"

    expect(page.body).to match(/#{@craven.name}.*#{@kubrick.name}.*#{@hitchcock.name}/m)
  end

  xit 'displays when each director was created' do
    visit "/directors/"

    expect(page).to have_content("#{@craven.name} - created: #{@craven.created_at}")
  end 

  xit 'links to directors edit page' do 
    # could figure out a way to make this testing more robust
    # wanted to use a within capybara command but could not figure it out
    visit '/directors/'
  
    page.first(:button, 'Edit').click

    expect(current_path).to eq("/directors/#{@craven.id}/edit")
  end

  xit 'links to directors delete page' do 
    visit '/directors'

    page.first(:button, 'Delete').click

    expect(current_path).to eq("/directors")
    expect(page).to_not have_content('Wes Craven')
  end

# Extension 2: Search by name (exact match)

# As a visitor
# When I visit an index page ('/parents') or ('/child_table_name')
# Then I see a text box to filter results by keyword
# When I type in a keyword that is an exact match of one or more of my records and press the Search button
# Then I only see records that are an exact match returned on the page

  xit 'exact searches for a director using a keyword' do 
    visit '/directors'

    fill_in('Search', with: 'Alfred Hitchcock')

    click_button 'Search Directors'
    
    expect(current_path).to eq('/directors')

    expect(page).to have_content('Alfred Hitchcock')
    expect(page).to_not have_content('Wes Craven')
    expect(page).to_not have_content('Stanley Kubrick')
  end

  it 'partial searches for a director using a keyword' do 
    @hitchcock2 = Director.create!(name: 'Dennis Hitchcock', birth_year: 1899, birth_place: 'Essex, England', still_active: false)

    visit '/directors'

    fill_in(:partial_search, with: 'Hitchcock')

    click_button 'Search Directors'
    
    expect(current_path).to eq('/directors')

    expect(page).to have_content('Alfred Hitchcock')
    expect(page).to have_content('Dennis Hitchcock')
    expect(page).to_not have_content('Wes Craven')
    expect(page).to_not have_content('Stanley Kubrick')
  end
end