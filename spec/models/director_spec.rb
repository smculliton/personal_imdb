require 'rails_helper'

RSpec.describe Director do
  before(:each) do 
    @kubrick = Director.create!(name: 'Stanley Kubrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: false)
    @shining = @kubrick.movies.create!(name: 'The Shining', release_year: 1980, mpaa_rating: 'R', run_time: 146, rotten_tomatoes_score: 82, oscar_winner: false)
    @space = @kubrick.movies.create!(name: '2001: A Space Odyssey', release_year: 1968, mpaa_rating: 'G', run_time: 159, rotten_tomatoes_score: 92, oscar_winner: true)
    @clockwork = @kubrick.movies.create!(name: 'A Clockwork Orange', release_year: 1971, mpaa_rating: 'X', run_time: 136, rotten_tomatoes_score: 88, oscar_winner: false)

    @craven = Director.create!(name: 'Wes Craven', birth_year: 1939, birth_place: 'Cleveland, Ohio', still_active: false, created_at: DateTime.new(1991,3,13,4,5,6))

    @kubrick2 = Director.create!(name: 'Wesley Kubrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: false, created_at: DateTime.new(1996,3,13,4,5,6))
    @fakeshining = @kubrick2.movies.create!(name: 'The Fake Shining', release_year: 1980, mpaa_rating: 'R', run_time: 146, rotten_tomatoes_score: 82, oscar_winner: false)
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

  describe '#order_by_created_at' do
    it 'orders directors by created_at date time ' do 
      expect(Director.order_by_created_at).to eq([@craven, @kubrick2, @kubrick])
    end
  end

  describe '#exact_search' do 
    it 'returns directors based on if their name exactly matches a keyword' do 
      expect(Director.exact_search('Wes Craven')).to eq([@craven])
    end
  end

  describe '#partial_search' do 
    it 'returns directors based on if their name exactly matches a keyword' do 
      expect(Director.partial_search('Kubrick')).to eq([@kubrick, @kubrick2])
    end
  end

  describe '#order_by_movie_count' do 
    it 'orders directors by the amount of movies they have' do 
      expect(Director.order_by_movie_count).to eq([@kubrick, @kubrick2, @craven])
    end
  end
end