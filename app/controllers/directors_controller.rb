class DirectorsController < ApplicationController
  def index
    if params[:sort] == 'moviecount'
      @directors = Director.order_by_movie_count
    else
      @directors = Director.order_by_created_at
    end

    if params[:search] != nil
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

private
  def director_params
    params.permit(:name, :birth_place, :birth_year, :still_active)
  end
end