class SessionsController < ApplicationController

    def welcome

    end

    def new
    end

    def create
        u = User.find_by_email(params[:email])
        if u && u.authenticate(params[:password])
            session[:user_id] = u.id
            redirect_to user_path(u)
        else
            flash[:alert] = "Invalid credentials. Please try again!"
            redirect_to '/login'
        end
    end

end
