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
            render 'new'
        end 
    end 

    def show 
        if @restaurant != nil
            @reviews = @restaurant.reviews.all
            @review = Review.new
        else 
            flash[:alert] = "Invalid restaurant request."
            redirect_to states_path
        end 
    end 

    def index 
        @restaurants = @state.restaurants
    end
    
    def edit
        if @restaurant == nil
            flash[:alert] = "Invalid restaurant request."
            redirect_to states_path
        end 
    end 
    
    def update 
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

    def order_by_vegan_rating 
        @restaurants = Restaurant.order_by_vegan_rating
    end 

    private 
    
    def get_state
        @state = State.find(params[:state_id])
    end

    def find_restaurant 
        @restaurant = Restaurant.find_by(id: params[:id])
    end 
     
    def restaurant_params
        params.require(:restaurant).permit(:name, :description, :address, :phone_number, :vegan_friendliness_rating, :price_rating, :user_id, :state_id, :search)  
    end 
end
