class UsersController < ApplicationController
    before_action :authorized, except: [:new, :create]

    def new 
        @user = User.new
        render :layout => "welcome"
    end

    def create 
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            redirect_to root_path
        end
    end 

    def show 
        @user = User.find_by(id: params[:id])
    end 

    private 

    def user_params 
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
    end


end
