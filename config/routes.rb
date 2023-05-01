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
  post '/removeDayInfo' => 'days#removeItem'
  get '/recipeSearch' => 'recipes#getRecipeById'
  get '/userFavourites' => 'favourites#getFavouritesByUserId'
  post '/addCustomMealNutrients' => 'days#addCustomMeal'


  root to: redirect('/healthcheck', status: 302)
  get "/healthcheck", to: proc { [200, {}, ["success"]] }
end
