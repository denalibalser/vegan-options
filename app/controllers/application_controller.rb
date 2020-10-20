class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_user
    helper_method :logged_in?
    helper_method :state_restaurant

    def current_user
        if session[:user_id]
          User.find(session[:user_id])
        end
      end
    
    def logged_in?
        !!current_user
    end

    # def state_restaurant(restaurant) 
    #     @restaurant = Restaurant.find_by(state_id: [:restaurant][:state_id]) 
    #     if @restaurant == nil 
    #         puts 'No restaurant submissions'
    #     elsif restaurant.state.id == @restaurant
    #             restaurant.name 
    #     end 
    # end
 
end
