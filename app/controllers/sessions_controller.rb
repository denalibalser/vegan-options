class SessionsController < ApplicationController
    before_action :authorized, except: [:new, :create]

    def new
        render :layout => "welcome"
    end 

    def create
        #binding.pry
        # OAuth login/signup flow: 
        # if auth_hash = request.env["omniauth.auth"]
        #      #they logged in with OAuth
        #     oauth_email = request.env["omniauth.auth"]["info"]["email"]
        #      if @user = User.find_by(email: oauth_email)
        #         session[:user_id] = @user.id
        #     else 
        #         @user = User.create(first_name: request.env["omniauth.auth"]["info"][""], last_name: etc.)
        #  else 
        @user = User.find_by(username: params[:user][:username]) 
        if @user && @user.authenticate(params[:user][:password]) 
            session[:user_id] = @user.id
            

            redirect_to user_path(@user)  
        else 
            redirect_to root_path
        end
       #end 
      #end
    end 

    def destroy 
        reset_session 
        redirect_to root_path
    end 

    private 

    def auth 
        request.env['omniauth.auth']
    end 
end
