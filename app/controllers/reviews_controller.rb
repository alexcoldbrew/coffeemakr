class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    def new
        @recipe = Recipe.find_by_id(params[:recipe_id])
        @review = Review.new
    end

    def create
       
        @recipe = Recipe.find_by_id(params[:recipe_id])
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
        @review = Review.find_by_id(params[:id])
        unless current_user.id == @review.user_id
            redirect_to review_path(@review)
        end
    end

    def update
        @review = Review.find_by_id(params[:id])
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
        @review = Review.find_by_id(params[:id])
        @review.destroy
        redirect_to reviews_path
    end

    private

    def reviews_params
        params.require(:review).permit(:content, :rating)
    end
end
