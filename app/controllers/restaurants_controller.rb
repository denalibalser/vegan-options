class RestaurantsController < ApplicationController
    before_action :get_state, only: [:index]
    before_action :authorized #is this correct?

    require 'pry'
    def new 
        @restaurant = Restaurant.new 
    end 

    def create 
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.user_id = current_user.id  #may need to work on this --- but is working now i think

        @restaurant.save

        redirect_to restaurant_path(@restaurant)
    end 

    def show 
        @restaurant = Restaurant.find_by(id: params[:id]) 
        @reviews = @restaurant.reviews.all
        @review = Review.new
        @review.restaurant_id = @restaurant.id
        @review.user_id = current_user.id
    end 

    def index 
        @restaurants = @state.restaurants
    end
    
    def edit
        @restaurant = Restaurant.find_by(id: params[:id]) 
    end 
    
    def update 
        @restaurant.find_by(id: params[:id])
        @restaurant.update(restaurant_params)

        redirect_to restaurant_path(@restaurant)
    end 
    
    def destroy 
        @restaurant.find_by(id: params[:id])
        @restaurant.destroy

        redirect_to states_path
    end 
#replace @restaurant.find_by(id: params[:id]) with private method that does the same

    private 
    
    def get_state
         @state = State.find(params[:state_id])
    end
     
    def restaurant_params
        params.require(:restaurant).permit(:name, :description, :address, :phone_number, :vegan_friendliness_rating, :price_rating, :user_id, :state_id)  
    end 
    
end
