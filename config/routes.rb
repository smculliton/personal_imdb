Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Director Routes
  get '/directors/', to: 'directors#index'
  get '/directors/new', to: 'directors#new'
  get '/directors/:id/', to: 'directors#show'
  post '/directors/', to: 'directors#create'
  get '/directors/:id/edit', to: 'directors#edit'
  patch '/directors/:id', to: 'directors#update'
  delete '/directors/:id', to: 'directors#destroy'
  
  # Director-Movies Routes
  get '/directors/:id/movies/', to: 'directors_movies#index'
  get '/directors/:id/movies/new', to: 'directors_movies#new'
  post '/directors/:director_id/movies/create', to: 'directors_movies#create'
  post '/directors/:id/movies', to: 'directors_movies#index'

  # Movie Routes
  get '/movies/', to: 'movies#index'
  get '/movies/:id/', to: 'movies#show'
  get '/movies/:id/edit', to: 'movies#edit'
  patch '/movies/:id/update', to: 'movies#update'
  delete '/movies/:id', to: 'movies#destroy'
end
