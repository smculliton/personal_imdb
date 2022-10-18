class DirectorsController < ApplicationController
  def index
    if params[:search] == nil
      @directors = Director.order_by_created_at
    else
      params[:exact_match] == '1' ? @directors = Director.order_by_created_at.exact_search(params[:search]) : @directors = Director.order_by_created_at.partial_search(params[:search])
    end
  end

  def show
    @director = Director.find(params[:id])
  end

  def new
  end

  def create
    Director.create!(director_params)
    
    redirect_to '/directors'
  end

  def edit 
    @director = Director.find(params[:id])
  end

  def update 
    director = Director.find(params[:id])
    director.update(director_params)

    redirect_to "/directors/#{director.id}"
  end

  def destroy
    director = Director.find(params[:id])
    director.destroy

    redirect_to "/directors"
  end

  def sort
    @directors = Director.all
    @directors = @directors.sort_by { |director| -director.movie_count }
  end


private
  def director_params
    params.permit(:name, :birth_place, :birth_year, :still_active)
  end
end