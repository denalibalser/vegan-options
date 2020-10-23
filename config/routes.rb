Rails.application.routes.draw do
  root 'welcome#home'
  resources :states do 
    resources :restaurants, only: [:index] #also maybe edit and update
  end
  resources :users
  resources :restaurants do 
    resources :reviews
  end 

  get 'restaurants/new' => 'restaurants#new'
  post 'restaurants' => 'restaurants#create'
  #get 'restaurants/:id' => 'restaurants#show', as: 'restaurant'
  #get 'restaurants/:id/edit' => 'restaurants#edit', as: 'edit_restaurant'
  post 'restaurants/:id' => 'restaurants#update'
  get 'restaurants/:id/destroy' => 'restaurants#destroy', as: 'delete_restaurant'
  post 'restaurants/:id/destroy' => 'restaurants#destroy'
  
  get '/signup' => 'users#new'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

  get '/states' => 'states#index'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
