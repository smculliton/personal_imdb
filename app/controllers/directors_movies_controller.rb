class DirectorsMoviesController < ApplicationController
  def index 
    @director = Director.find(params[:id])
    if params[:sort] == 'alpha'
      @movies = @director.filtered_movies(@director.movies_by_name, params[:rotten_tomatoes])
    else
      @movies = @director.filtered_movies(@director.movies, params[:rotten_tomatoes])
    end
  end

  def new
    @director = Director.find(params[:id])
  end

  def create
    @director = Director.find(params[:director_id])
    @director.movies.create!(movie_params)

    redirect_to "/directors/#{@director.id}/movies"
  end

private
  def movie_params
    params.permit(:name, :release_year, :mpaa_rating, :run_time, :rotten_tomatoes_score, :oscar_winner)
  end 
end