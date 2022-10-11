class DirectorsController < ApplicationController
  def index
    @directors = Director.all.sort_by(&:created_at)
  end

  def show
    @director = Director.find(params[:id])
  end
end