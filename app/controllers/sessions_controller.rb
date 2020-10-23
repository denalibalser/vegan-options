class SessionsController < ApplicationController
    before_action :authorized, except: [:new, :create]

    def new
        render :layout => "welcome"
    end 

    def create
        @user = User.find_by(username: params[:user][:username]) 
        if @user && @user.authenticate(params[:user][:password]) 
            session[:user_id] = @user.id
            

            redirect_to user_path(@user)  
        else 
            redirect_to root_path
        end 
    end 

    def destroy 
        reset_session 
        redirect_to root_path
    end 
end
