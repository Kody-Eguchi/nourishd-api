Rails.application.routes.draw do
  resources :days
  resources :favourites
  resources :users
  resources :recipes

  get '/login' => 'sessions#index'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
