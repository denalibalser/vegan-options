class RestaurantsController < ApplicationController
    before_action :get_state, only: [:index]
    before_action :authorized 
    before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

    def new 
        @restaurant = Restaurant.new 
    end 

    def create 
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.user_id = current_user.id
        if @restaurant.valid? 

            @restaurant.save
            redirect_to restaurant_path(@restaurant)
        else 
            #why does browser URL direct  to '/restaurants' when errors are present?
            render 'new'
        end 
    end 

    def show 
        @reviews = @restaurant.reviews.all
        @review = Review.new
        @review.restaurant_id = @restaurant.id
        @review.user_id = current_user.id
    end 

    def index 
        @restaurants = @state.restaurants
    end
    
    def edit
        
    end 
    
    def update #WORKING ON THIS ONE
        @restaurant.update(restaurant_params)
        if @restaurant.valid?

            redirect_to restaurant_path(@restaurant)
        else 
            render 'edit'
        end
    end 
    

    def destroy 
        @restaurant.destroy

        redirect_to states_path
    end 

    private 
    
    def get_state
         @state = State.find(params[:state_id])
    end

    def find_restaurant 
        @restaurant = Restaurant.find_by(id: params[:id])
    end 
     
    def restaurant_params
        params.require(:restaurant).permit(:name, :description, :address, :phone_number, :vegan_friendliness_rating, :price_rating, :user_id, :state_id)  
    end 
    
end
