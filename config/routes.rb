Rails.application.routes.draw do
  root 'static#home'
  get 'genres/index'
  get 'genres/new'
  get 'genres/show'

  #users
  get '/signup' => 'users#new'

  resources :users, only: %i[show update create] do 
    resources :reviews, only: %i[index]
    resources :favorites, only: %i[index]
  end
  resources :reviews, only: %i[destroy create edit update destroy]
  resources :views, only: %i[create destroy]

  #media
  resources :media, only: %i[show new]
  resources :genres, only: %i[index new create show]
  resources :artists, only: %i[index new create show] do 
    resources :albums, only: %i[index] do 
      resources :songs, only: %i[index]
    end
  end
  resources :albums, only: %i[new create show]
  resources :songs, only: %i[new create show]

  #sessions  
  get '/login/' => 'sessions#new'
  post '/logout/' => 'sessions#destroy'
  resources :sessions, only: %i[create]

  #omniauth
  get '/auth/:provider/callback' => 'sessions#omni_create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
