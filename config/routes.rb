Rails.application.routes.draw do
  root 'welcome#home'
  resources :states
  resources :reviews
  resources :restaurants
  resources :users
  
  get '/signup' => 'users#new'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  get '/states' => 'states#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
