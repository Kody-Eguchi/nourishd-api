Rails.application.routes.draw do
  resources :days
  resources :favourites
  resources :users
  resources :recipes

  get '/login' => 'sessions#index'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/status' => 'session#userLoggedIn?'

  get '/userInfo' => 'users#getUserById'
  get '/dayInfo' => 'days#getDayById'
  post '/updateDayInfo' => 'days#updateDayInfo'
  get '/recipeSearch' => 'recipes#getRecipeById'
end
