Rails.application.routes.draw do
  root 'welcome#home'
  resources :states do 
    resources :restaurants #also maybe edit and update
  end
  resources :reviews
  resources :users

  get 'restaurants/new' => 'restaurants#new'
  post 'restaurants/create' => 'restaurants#create'
  
  get '/signup' => 'users#new'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  get '/states' => 'states#index'

  #get '/states/:id/restaurants' => 'restaurants#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
