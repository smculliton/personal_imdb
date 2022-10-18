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

  def self.order_by_movie_count
    Director.left_joins(:movies).group(:id).order(Arel.sql('COUNT(movies.id) DESC'))
    #SELECT directors.name, COUNT(*) AS mycount FROM directors INNER JOIN movies ON movies.director_id = directors.id GROUP BY directors.id ORDER BY mycount;
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