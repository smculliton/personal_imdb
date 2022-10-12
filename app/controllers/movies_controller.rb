class MoviesController < ApplicationController
  def index
    @movies = Movie.where(oscar_winner: true)
  end

  def show 
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update 
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    
    redirect_to "/movies/#{@movie.id}"
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to '/movies'
  end

private
  def movie_params
    params.permit(:name, :release_year, :mpaa_rating, :run_time, :rotten_tomatoes_score, :oscar_winner)
  end 
end