Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  get '/authorized' => 'sessions#page_requires_login'
  get '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#omniauth'

  # resources :reviews,

  resources :recipes do
    resources :reviews, shallow: true
    resources :ingredients, only: [:index]
  end

  resources :ingredients

  resources :users
  
end
