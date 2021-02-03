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
            
            render :new
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def reviews_params
        params.require(:review).permit(:content, :rating)
    end
end
