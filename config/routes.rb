Rails.application.routes.draw do
  
  resources :reviews
  resources :users
  resources :movies
  # Routing logic: fallback requests for React Router.
  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/new', to: 'movies#create'
  get '/myreviews', to: 'reviews#my_reviews'
  post '/update', to: 'reviews#update'

  
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
