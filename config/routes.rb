Rails.application.routes.draw do
  root 'welcome#home'
  resources :states
  resources :reviews
  resources :restaurants
  resources :users
  
  get '/login' => 'users#new'
  get '/signup' => 'sessions#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
