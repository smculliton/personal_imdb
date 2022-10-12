class DirectorsMoviesController < ApplicationController
  def index 
    @director = Director.find(params[:id])
  end
end