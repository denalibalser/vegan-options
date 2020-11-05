Rails.application.routes.draw do
  root 'welcome#home'
  resources :states, shallow: true do 
    resources :restaurants, only: [:index] do #should restaurants#show & edit/update be nested as well?
      resources :reviews
    end
  end
  resources :users, only: [:new, :create, :show, :edit, :update] #added , only: [:new, :create, :show]
  # resources :restaurants do 
  #   resources :reviews
  # end 


  #post 'users/new' => 'users#create'   {:action=>"create", :controller=>"things"}

  get 'restaurants/new' => 'restaurants#new', as: 'new_restaurant'
  post 'restaurants' => 'restaurants#create'
  get 'restaurants/:id' => 'restaurants#show', as: 'restaurant'
  get 'restaurants/:id/edit' => 'restaurants#edit', as: 'edit_restaurant'
  post 'restaurants/:id' => 'restaurants#update'
  patch 'restaurants/:id' => 'restaurants#update'
  get 'restaurants/:id/destroy' => 'restaurants#destroy', as: 'delete_restaurant'
  post 'restaurants/:id/destroy' => 'restaurants#destroy'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

  get '/states' => 'states#index'

  #route for OAuth facebook signing:
  get '/auth/facebook/callback' => 'sessions#create'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
