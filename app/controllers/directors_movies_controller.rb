class DirectorsMoviesController < ApplicationController
  def index 
    @director = Director.find(params[:id])
  end

  def new
  end
end