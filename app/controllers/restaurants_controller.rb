class RestaurantsController < ApplicationController
    def new 
        @restaurant = Restaurant.new 
    end 

    def create 
        @restaurant = Restaurant.create(restaurant_params)

        redirect_to restaurant_path(@restaurant)
    end 

    def show  
    end 

    private  

    def restaurant_params  
    end 
    
end
