class SessionsController < ApplicationController

    skip_before_action :authorized, only: [:new, :create, :welcome, :omniauth]

    def welcome
        render layout: false
    end

    def new
        @user = User.new
        render layout: false
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to recipes_path
        else
            flash.now[:messages] = "Invalid credentials. Try something else."
            render :new
        end
    end

    def destroy
        session.destroy
        redirect_to '/'
    end

    def omniauth
        user = User.create_from_omniauth(auth)
        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
           flash[:message] = user.errors.full_messages.join(", ")
            redirect_to '/'
        end
     end

    private

    def auth
        request.env['omniauth.auth']
    end

end
