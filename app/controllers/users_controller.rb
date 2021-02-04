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
    end

    def create
        @user = User.create(user_params)
    
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
            # maybe redirect to welcome page after sign up?
        else
            flash.now[:messages] = @user.errors.full_messages
            render :new
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
