class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find_by_id(params[:id])
    end

    def new
        @recipe = Recipe.new
        @ingredients = Ingredient.all
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
        @recipe = Recipe.find_by_id(params[:id])
        
    end

    def update
        @recipe = Recipe.find_by_id(params[:id])
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end
    end

    def destroy
        @recipe = Recipe.find_by_id(params[:id])
        @recipe.destroy
        redirect_to recipes_path
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :description, :date_created, :user_id, :ingredient_ids, ingredient_ids: [])
    end

end
