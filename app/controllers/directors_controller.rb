class DirectorsController < ApplicationController
  def index
    @directors = Director.all.sort_by(&:created_at)
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


  private
  def director_params
    new = params.permit(:name, :birth_place, :birth_year, :still_active)
    new[:still_active] == '1' ? new[:still_active] = true : new[:still_active] = false
    new
  end
end