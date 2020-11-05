class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_user
    helper_method :logged_in?
    # helper_method :user_restaurant?


    def current_user
        if session[:user_id]
          User.find(session[:user_id])
        end
      end
    
    def logged_in?
        !!current_user
    end

    def authorized
        if !logged_in?
          redirect_to root_path
        end
    end

    # def user_restaurant? 
    #     @restaurants = Restaurant.all
    #     if @restaurants != nil
    #         @restaurants.each do |restaurant|
    #             if restaurant.user_id == current_user.id 
    #                 true
    #             else  
    #                 false
    #             end
    #         end 
    #     end 
    # end 

 
end
