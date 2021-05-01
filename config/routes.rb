Rails.application.routes.draw do
  resources :users, only: %i[show]
  root 'static#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  get '/login/' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
