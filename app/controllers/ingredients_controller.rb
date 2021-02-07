class IngredientsController < ApplicationController
    before_action :find_ingredient, only: [:show, :edit, :update, :destroy]

    def index
        @recipe = Recipe.find_by_id(params[:recipe_id])
        if @recipe
            @ingredients = Ingredient.all
        else
            redirect_to recipes_path
        end
    end

    def show
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredients_params)
        if @ingredient.save
            redirect_to new_recipe_path
        else

            render :new
        end
    end

    def edit
    end

    def update
        if @ingredient.update(ingredients_params)
            redirect_to ingredient_path(@ingredient)
        else
            render :edit
        end
    end

    def destroy
        @ingredient.destroy
        redirect_to ingredients_path
    end

    def list
        @ingredients = Ingredient.all
    end

    private

    def ingredients_params
        params.require(:ingredient).permit(:name, :amount)
    end

    def find_ingredient
        @ingredient = Ingredient.find_by_id(params[:id])
    end

end
