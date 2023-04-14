Rails.application.routes.draw do
  resources :favourites
  resources :users
  resources :recipes
end
