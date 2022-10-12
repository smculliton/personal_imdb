require 'rails_helper'

RSpec.describe Movie do
  it { should belong_to :director } 

  before(:each) do 
    @kubrick = Director.create!(name: 'Stanley Kubrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: false)
    @shining = @kubrick.movies.create!(name: 'The Shining', release_year: 1980, mpaa_rating: 'R', run_time: 146, rotten_tomatoes_score: 82, oscar_winner: false)
    @space = @kubrick.movies.create!(name: '2001: A Space Odyssey', release_year: 1968, mpaa_rating: 'G', run_time: 159, rotten_tomatoes_score: 92, oscar_winner: true)
  end

  describe '#oscar_winner?' do 
    it 'returns boolean of whether movie has won an oscar' do 
      expect(@shining.oscar_winner?).to be(false)
      expect(@space.oscar_winner?).to be(true)
    end
  end
end