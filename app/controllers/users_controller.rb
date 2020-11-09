class UsersController < ApplicationController
    before_action :authorized, except: [:new, :create]
    before_action :find_user, except: [:new, :create]
  

    def new 
        @user = User.new
    end

    def create 
        @user = User.create(user_params)
       
        if @user.valid?
            
            @user.save
            
            session[:user_id] = @user.id
            redirect_to user_path(current_user) 
        else
            if User.find_by(username: params[:user][:username]) || User.find_by(email: params[:user][:email])
                flash[:alert] = "Looks like you've already signed up!"
                redirect_to signin_path 
        else 
            render 'new'  
        end
        end  
    end 

    def show 
        @restaurants = Restaurant.all 
    end 

    def edit 
  
    end

    def update 
        if @user.update(user_params)
            redirect_to user_path(current_user)
        else 
            render 'edit'
        end 
    end 


    private 

    def find_user 
        @user = current_user
    end 

    def user_params 
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
    end
end
