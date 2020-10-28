class UsersController < ApplicationController
    before_action :authorized, except: [:new, :create]
    layout 'welcome'

    def new 
        @user = User.new
    end

    def create #this method is also redirected to '/users URL - show view even if @user is invalid, just like restaurants#create'
        @user = User.create(user_params)
       
        if @user.valid?
            #binding.pry
            @user.save
            
            session[:user_id] = @user.id
            redirect_to user_path(current_user) 
        else 
            render 'new'  
        end
        
    end 

    def show 
        @user = current_user
        render :layout => 'application'
        #@restaurant = Restaurant.find_by(id: params[:id]) not working
    end 

    private 

    def user_params 
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
    end


end
