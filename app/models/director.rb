class Director < ApplicationRecord
  has_many :movies

  def movie_count
    movies.length
  end

  def filtered_movies(min_rot_toms_score)
    min_rot_toms_score = 0 if min_rot_toms_score == nil
    movies.order(:name).where("rotten_tomatoes_score >= #{min_rot_toms_score}")
  end
end