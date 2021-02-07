class ReviewsController < ApplicationController
    before_action :find_recipe, only: [:new, :create]
    before_action :find_review, only: [:show, :edit, :update, :destroy]

    def index
        @reviews = Review.all
    end

    def show
    end

    def new
        @review = Review.new
    end

    def create
        @review = @recipe.reviews.build(reviews_params)
        @review.user = current_user
   
        if @review.save
            redirect_to recipe_path(@recipe)
        else
            flash.now[:messages] = @review.errors.full_messages
            render :new
        end
    end

    def edit
        unless current_user.id == @review.user_id
            redirect_to review_path(@review)
        end
    end

    def update
        if current_user.id == @review.user_id
            if @review.update(reviews_params)
                redirect_to review_path(@review)
            else
                render :edit
            end
        else
            redirect_to review_path(@review)
        end
    end

    def destroy
        @review.destroy
        redirect_to reviews_path
    end

    private

    def reviews_params
        params.require(:review).permit(:content, :rating)
    end

    def find_review
        @review = Review.find_by_id(params[:id])
    end

    def find_recipe
        @recipe = Recipe.find_by_id(params[:recipe_id])
    end
end
