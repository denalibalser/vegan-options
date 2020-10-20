class RestaurantsController < ApplicationController
    def new 
        @restaurant = Restaurant.new 
    end 

    def create 
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.save

        redirect_to restaurant_path(@restaurant)
    end 

    def show 
        @restaurant = Restaurant.find_by(id: params[:id]) 
    end 

    private  

    def restaurant_params
        params.require(:restaurant).permit(:name, :description, :address, :phone_number, :vegan_friendliness_rating, :price_rating)  
    end 
    
end
