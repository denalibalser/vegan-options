class RestaurantsController < ApplicationController
    before_action :get_state

    require 'pry'
    def new 
        #@restaurant = Restaurant.new 
        @restaurant = @state.restaurants.build
    end 

    def create 
        #@restaurant = Restaurant.new(restaurant_params)
        @restaurant = @state.restaurants.build(restaurant_params)
        @restaurant.user_id = current_user.id  #may need to work on this --- but is working now i think

        @restaurant.save

        redirect_to restaurant_path(@restaurant)
    end 

    def show 
        @restaurant = Restaurant.find_by(id: params[:id]) 
    end 

    def index 
        #@restaurants = Restaurant.all
        @restaurants = @state.restaurants
    end 

    private 
    
    def get_state
        @state = State.find(params[:state_id])
    end

    def restaurant_params
        params.require(:restaurant).permit(:name, :description, :address, :phone_number, :vegan_friendliness_rating, :price_rating, :user_id, :state_id)  
    end 
    
end
