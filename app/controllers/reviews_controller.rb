class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    def new
        @review = Review.new
    end

    def create
        @recipe = Recipe.find_by_id(params[:id])
        @review = Review.new(reviews_params)
   
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
