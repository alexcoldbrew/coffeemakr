class SessionsController < ApplicationController

    skip_before_action :authorized, only: [:new, :create, :welcome]

    def welcome
    end

    def new
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:alert] = "Invalid credentials. Please try again!"
            redirect_to '/login'
        end
    end

    def destroy
        session.destroy
        redirect_to '/'
    end

    def page_requires_login

    end

    def omniauth
        user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.email = auth['info']['email']
        end
        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:alert] = "Didn't work. Please try again!"
            redirect_to '/login'
        end
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end
