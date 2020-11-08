class UsersController < ApplicationController
    before_action :authorized, except: [:new, :create]
    before_action :find_user, except: [:new, :create]
    layout 'welcome'

    def new 
        @user = User.new
    end

    def create #this method is also redirected to '/users URL - show view even if @user is invalid, just like restaurants#create'
        @user = User.create(user_params)
       
        if @user.valid?
            
            @user.save
            
            session[:user_id] = @user.id
            redirect_to user_path(current_user) 
        else 
            render 'new'  
        end 
    end 

    def show 
        @restaurants = Restaurant.all
        render :layout => 'application' 
    end 

    def edit 
        render :layout => 'application'
    end

    def update 
        @user.update(user_params)

        redirect_to user_path(current_user)
    end 

    private 

    def find_user 
        @user = current_user
    end 

    def user_params 
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
    end
end
