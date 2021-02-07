class RecipesController < ApplicationController
    before_action :find_recipe, only: [:show, :edit, :update, :destroy]

    def index
        @recipes = Recipe.all
    end

    def show
        @reviews = @recipe.reviews
    end

    def new
        @recipe = Recipe.new
        @ingredients = Ingredient.all
    end

    def create
        @recipe = current_user.recipes.build(recipe_params)
        
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            flash.now[:messages] = @recipe.errors.full_messages
            render :new
        end
    end

    def edit
        unless current_user.id == @recipe.user_id
            redirect_to recipe_path(@recipe)
        end
    end

    def update
        if current_user.id == @recipe.user_id
            if @recipe.update(recipe_params)
                redirect_to recipe_path(@recipe)
            else
                render :edit
            end
        else
            redirect_to recipe_path(@recipe)
        end
    end

    def destroy
        @recipe.destroy
        redirect_to recipes_path
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :description, :date_created, :user_id, :ingredient_ids, ingredient_ids: [])
    end

    def find_recipe
        @recipe = Recipe.find_by_id(params[:id])
    end
end
