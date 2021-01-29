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

end
