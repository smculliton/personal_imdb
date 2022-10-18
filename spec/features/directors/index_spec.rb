require 'rails_helper' 

RSpec.describe 'the Director index' do 
  before(:each) do 
    @kubrick = Director.create!(name: 'Stanley Kubrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: false)
    @hitchcock = Director.create!(name: 'Alfred Hitchcock', birth_year: 1899, birth_place: 'Essex, England', still_active: false)
    @craven = Director.create!(name: 'Wes Craven', birth_year: 1939, birth_place: 'Cleveland, Ohio', still_active: false, created_at: DateTime.new(1991,3,13,4,5,6))

    @shining = @kubrick.movies.create!(name: 'The Shining', release_year: 1980, mpaa_rating: 'R', run_time: 146, rotten_tomatoes_score: 82, oscar_winner: false)
    @space = @kubrick.movies.create!(name: '2001: A Space Odyssey', release_year: 1968, mpaa_rating: 'G', run_time: 159, rotten_tomatoes_score: 92, oscar_winner: true)
    @birds = @hitchcock.movies.create!(name: 'The Birds', release_year: '1963', mpaa_rating: 'PG-13', run_time: 119, rotten_tomatoes_score: 93, oscar_winner: false)
  end

  # User Story 1, Parent Index
  it 'has the name of every director' do
    visit "/directors/"

    expect(page).to have_content(@kubrick.name)
    expect(page).to have_content(@hitchcock.name)
  end

  # User Story 6, Parent Index sorted by Most Recently Created
  it 'is sorted by most recently created' do 
    visit "/directors/"

    expect(page.body).to match(/#{@craven.name}.*#{@kubrick.name}.*#{@hitchcock.name}/m)
  end

  it 'displays when each director was created' do
    visit "/directors/"

    expect(page).to have_content("#{@craven.name} - created: #{@craven.created_at}")
  end 

  it 'links to directors edit page' do 
    # could figure out a way to make this testing more robust
    # wanted to use a within capybara command but could not figure it out
    visit '/directors/'
  
    page.first(:button, 'Edit').click

    expect(current_path).to eq("/directors/#{@craven.id}/edit")
  end

  it 'links to directors delete page' do 
    visit '/directors'

    page.first(:button, 'Delete').click

    expect(current_path).to eq("/directors")
    expect(page).to_not have_content('Wes Craven')
  end

# Extension 2: Search by name (exact match)
  it 'exact searches for a director using a keyword' do 
    visit '/directors'

    fill_in('Search', with: 'Alfred Hitchcock')

    check('Exact Matches Only')
    click_button 'Search Directors'
    
    expect(current_path).to eq('/directors')

    expect(page).to have_content('Alfred Hitchcock')
    expect(page).to_not have_content('Wes Craven')
    expect(page).to_not have_content('Stanley Kubrick')
  end

# Extension 3: Search by name (partial match)
  it 'partial searches for a director using a keyword' do 
    @hitchcock2 = Director.create!(name: 'Dennis Hitchcock', birth_year: 1899, birth_place: 'Essex, England', still_active: false)

    visit '/directors'

    fill_in('Search', with: 'Hitchcock')

    uncheck('Exact Matches Only')
    click_button 'Search Directors'
    
    expect(current_path).to eq('/directors')

    expect(page).to have_content('Alfred Hitchcock')
    expect(page).to have_content('Dennis Hitchcock')
    expect(page).to_not have_content('Wes Craven')
    expect(page).to_not have_content('Stanley Kubrick')
  end

  # Extension 1: Sort Parents by Number of Children 

  # As a visitor
  # When I visit the Parents Index Page
  # Then I see a link to sort parents by the number of `child_table_name` they have
  # When I click on the link
  # I'm taken back to the Parent Index Page where I see all of the parents in order of their count of `child_table_name` (highest to lowest) And, I see the number of children next to each parent name
  context 'sorting directors by movie count' do
    it 'has a link to sort directors by # of movies' do 
      visit '/directors'

      click_link 'Sort By Movie Count'

      expect(current_path).to eq('/directors')
      expect(page.body).to match(/#{@kubrick.name}.*#{@hitchcock.name}.*#{@craven.name}/m)
    end

    it 'displays movie count'
  end

end