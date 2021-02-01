class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find_by_id(params[:id])
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.create(recipe_params)
        if @recipe.save
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

    def recipe_params
        params.require(:recipe).permit(:name, :description, :date_created, :user_id)
    end

end
