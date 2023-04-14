Rails.application.routes.draw do
  resources :days
  resources :favourites
  resources :users
  resources :recipes
end
