class SessionsController < ApplicationController
    before_action :authorized, except: [:new, :create, :omni_create]

    def new
        
    end 

    def create
        @user = User.find_by(username: params[:user][:username]) 
        if @user && @user.authenticate(params[:user][:password]) 
            session[:user_id] = @user.id
            
            redirect_to user_path(@user)  
        else 
            flash[:alert] = "User not found."
            redirect_to signin_path
        end 
    end

    def omni_create
        if auth
            @user = User.find_or_create_by(email: auth['info']['email']) do |u|
                u.username = auth['info']['name']
                u.first_name = auth['info']['name']
                u.last_name = auth['info']['name']
                u.uid = auth['uid']
                u.provider = auth['provider']

                if !u.password 
                    u.password = SecureRandom.hex(10) 
                end
            end
            if @user.persisted?

                session[:user_id] = @user.id
                redirect_to user_path(@user)  
            else 
                redirect_to root_path
            end    
        else 
          redirect_to root_path
        end
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
