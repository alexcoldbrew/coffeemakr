class UsersController < ApplicationController

    skip_before_action :authorized, only: [:new, :create]

    def index
    end

    def show
        @user = User.find_by_id(params[:id])
        @recipes = @user.recipes
    end

    def new
        @user = User.new
        render layout: false
    end

    def create
        @user = User.create(user_params)
    
        if @user.save
            session[:user_id] = @user.id
            redirect_to "/"
        else
            flash.now[:messages] = @user.errors.full_messages
            render :new
        end
    end

    # choosing to not let users update or delete their accounts, for now.

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
