Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/directors/', to: 'directors#index'
  get '/directors/new', to: 'directors#new'
  get '/directors/:id/', to: 'directors#show'
  get '/movies/', to: 'movies#index'
  get '/movies/:id/', to: 'movies#show'
  get '/directors/:id/movies/', to: 'directors_movies#index'
  post '/directors/', to: 'directors#create'
  get '/directors/:id/edit', to: 'directors#edit'
  patch '/directors/:id', to: 'directors#update'
  get '/directors/:id/movies/new', to: 'directors_movies#new'
  post '/directors/:director_id/movies/create', to: 'directors_movies#create'
  get '/movies/:id/edit', to: 'movies#edit'
  patch '/movies/:id/update', to: 'movies#update'
  delete '/directors/:id', to: 'directors#destroy'
end
