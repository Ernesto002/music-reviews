Rails.application.routes.draw do
  resources :users, only: %i[show]
  root 'static#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  get '/login/' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#omni_create'
  get '/auth/google_oauth2/callback' => 'sessions#omni_create'
  get '/auth/twitter/callback' => 'sessions#omni_create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
