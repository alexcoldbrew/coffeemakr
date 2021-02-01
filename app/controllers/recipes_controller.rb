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
        # assign ingredient_ids here upon creation?
        @recipe = current_user.recipes.build(recipe_params)
        
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
        params.require(:recipe).permit(:name, :description, :date_created, :user_id, ingredient_ids: [])
    end

end
