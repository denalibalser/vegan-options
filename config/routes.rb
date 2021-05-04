Rails.application.routes.draw do
  root 'welcome#home'
  resources :states, only: [:index], shallow: true do 
    resources :restaurants, only: [:index] do 
      resources :reviews
    end
  end
  resources :users, except: [:delete] do 
    resources :restaurants, only: [:new, :create] 
  end

  #Scope method URL:
  get '/restaurants/order_by_vegan_rating' => 'restaurants#order_by_vegan_rating' 

  #restaurant routes:
  get 'restaurants/:id' => 'restaurants#show', as: 'restaurant'
  get 'restaurants/:id/edit' => 'restaurants#edit', as: 'edit_restaurant'
  post 'restaurants/:id' => 'restaurants#update'
  patch 'restaurants/:id' => 'restaurants#update'
  get 'restaurants/:id/destroy' => 'restaurants#destroy', as: 'delete_restaurant'
  post 'restaurants/:id/destroy' => 'restaurants#destroy'

  #sessions routes:
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

  #route for OAuth facebook signin:
  get '/auth/facebook/callback' => 'sessions#omni_create'

end
