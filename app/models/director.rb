class Director < ApplicationRecord
  has_many :movies

  def movie_count
    movies.length
  end
end