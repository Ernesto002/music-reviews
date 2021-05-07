Rails.application.routes.draw do  
  root 'static#home'

  #Users
  get '/signup' => 'users#new'
  resources :users, only: %i[show update create] do 
    resources :reviews, only: %i[index] 
    resources :favorites, only: %i[index]
  end
  resources :reviews, only: %i[create edit update destroy]
  resources :favorites, only: %i[create destroy]

  #Media
  resources :media, only: %i[show] 
  resources :artists, only: %i[index new create show] do
    resources :albums, only: %i[new] do
      resources :songs, only: %i[new]
    end
  end
  resources :albums, only: %i[create show]
  resources :songs, only: %i[create show]

  #Sessions
  get '/login' => 'sessions#new'
  post '/logout' => 'sessions#destroy'
  resources :sessions, only: %i[create]

  #Omniauth
  get '/auth/:provider/callback' => 'sessions#omni_create'

  #Fallback
  get '*path' => redirect('/')
end
