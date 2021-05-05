Rails.application.routes.draw do
  get 'artists/index'
  get 'artists/new'
  get 'artists/create'
  get 'artists/show'
  get 'albums/index'
  get 'albums/new'
  get 'albums/create'
  get 'albums/show'
  get 'songs/index'
  get 'songs/new'
  get 'songs/create'
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
  resources :media, only: %i[show]
  resources :genres, only: %i[index new create show]
  resources :artist, only %i[index new create show] do 
    resources :albums, only: %i[new] do 
      resources :songs, only: %i[new]
    end
  end
  resources :albums, only: %i[create show]
  resources :songs, only: %i[create show]

  #sessions  
  get '/login/' => 'sessions#new'
  post '/logout/' => 'sessions#destroy'
  resources :sessions, only: %i[create]

  #omniauth
  get '/auth/:provider/callback' => 'sessions#omni_create'

  #fallback
  get '*path' => redirect('/')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
