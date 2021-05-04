Rails.application.routes.draw do
  root 'static#home'

  #users
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :users, only: %i[show update] do 
    resources :reviews, only: %i[index]
    resources :favorites, only: %i[index]
  end
  resources :reviews, only: %i[destroy create edit update]
  resources :views, only: %i[destroy create]

  #media
  resources :media, only: %i[index show]
  resources :genres, only: %i[index new create show]
  resources :artists, only: %i[index new create show] do 
    resources :albums, only: %i[index] do 
      resources :songs, only: %i[index]
    end
  end
  resources :albums, only: %i[show create new]
  resources :songs, only: %i[show create new]

  #sessions  
  get '/login/' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  #omniauth
  get '/auth/:provider/callback' => 'sessions#omni_create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
