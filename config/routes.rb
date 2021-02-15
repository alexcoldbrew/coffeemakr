Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  get '/authorized' => 'sessions#page_requires_login'
  get '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#omniauth'
  get '/ingredient-list' => 'ingredients#list'

  resources :ingredients
  resources :reviews
  resources :users, except: [:edit, :update, :destroy] do
    resources :reviewed_recipes, only: [:index]
  end

  resources :recipes do
    resources :reviews, shallow: true
    resources :ingredients, only: [:index]
  end
  
end
