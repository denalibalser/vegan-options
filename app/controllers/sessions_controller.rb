class SessionsController < ApplicationController
    def new
    end 

    def create
        @user = User.find_by(username: params[:user][:username]) 
        if @user && @user.authenticate(params[:user][:password]) 
            session[:user_id] = @user.id
            

            redirect_to user_path(@user)  
        else 
            flash[:alert] = "User not found." #need to get flash messages working
            redirect_to root_path
        end 
    end 

    def destroy 
        reset_session 
        redirect_to root_path
    end 
end
