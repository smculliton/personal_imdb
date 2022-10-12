require 'rails_helper' 

RSpec.describe 'the Director index' do 
  before(:each) do 
    @kubrick = Director.create!(name: 'Stanley Kubrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: false)
    @hitchcock = Director.create!(name: 'Alfred Hitchcock', birth_year: 1899, birth_place: 'Essex, England', still_active: false)
    @craven = Director.create!(name: 'Wes Craven', birth_year: 1939, birth_place: 'Cleveland, Ohio', still_active: false, created_at: DateTime.new(1991,3,13,4,5,6))
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
    visit "/directors/"
  
    page.first(:link, 'Edit').click

    expect(current_path).to eq("/directors/#{@craven.id}/edit")
  end
end