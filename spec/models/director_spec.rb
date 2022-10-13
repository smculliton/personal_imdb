require 'rails_helper'

RSpec.describe Director do
  before(:each) do 
    @kubrick = Director.create!(name: 'Stanley Kubrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: false)
    @shining = @kubrick.movies.create!(name: 'The Shining', release_year: 1980, mpaa_rating: 'R', run_time: 146, rotten_tomatoes_score: 82, oscar_winner: false)
    @space = @kubrick.movies.create!(name: '2001: A Space Odyssey', release_year: 1968, mpaa_rating: 'G', run_time: 159, rotten_tomatoes_score: 92, oscar_winner: true)
    @clockwork = @kubrick.movies.create!(name: 'A Clockwork Orange', release_year: 1971, mpaa_rating: 'X', run_time: 136, rotten_tomatoes_score: 88, oscar_winner: false)
  end

  it { should have_many :movies }

  describe '#movie_count' do 
    it 'returns amount of movies associated with director' do
      expect(@kubrick.movie_count).to eq(3)
    end
  end

  describe '#movies_by_name' do 
    it 'returns directors movies sorted by name' do 
      expect(@kubrick.movies_by_name).to eq([@space, @clockwork, @shining])
    end
  end

  describe '#filtered_movies' do 
    it 'only selects movies above a certain rotten tomatoes score' do 
      expect(@kubrick.filtered_movies(@kubrick.movies, 90)).to eq([@space])
    end
  end
end