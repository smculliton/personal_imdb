require 'rails_helper' 

RSpec.describe 'the Director index' do 
  before(:each) do 
    @kubrick = Director.create!(name: 'Stanley Kubrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: false)
    @hitchcock = Director.create!(name: 'Alfred Hitchcock', birth_year: 1899, birth_place: 'Essex, England', still_active: false)
  end

  # User Story 1, Parent Index
  describe 'parent index' do 
    it 'has the name of every director' do
      visit "/directors/"

      expect(page).to have_content(@kubrick.name)
      expect(page).to have_content(@hitchcock.name)
    end
  end


end