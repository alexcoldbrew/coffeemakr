Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  get '/authorized' => 'sessions#page_requires_login'

  resources :reviews
  resources :ingredients
  resources :recipes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
