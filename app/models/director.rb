class Director < ApplicationRecord
  has_many :movies

  def self.order_by_created_at
    order(:created_at)
  end

  def self.exact_search(keyword)
    where(name: keyword)
  end

  def self.partial_search(keyword)
    where("name LIKE ?", "%#{keyword}%")
  end

  def movie_count
    movies.count
  end

  def movies_by_name
    movies.order(:name)
  end

  def filtered_movies(dir_movies, min_rot_toms_score)
    min_rot_toms_score = 0 if min_rot_toms_score == nil
    dir_movies.where("rotten_tomatoes_score >= #{min_rot_toms_score}")
  end
end