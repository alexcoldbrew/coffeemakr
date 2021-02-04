class IngredientsController < ApplicationController

    def index
        @recipe = Recipe.find_by_id(params[:recipe_id])
        if @recipe
            @ingredients = Ingredient.all
        else
            redirect_to recipes_path
        end
    end

    def show
        @ingredient = Ingredient.find_by_id(params[:id])
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
    end

    def destroy
    end

    private

    def ingredients_params
        params.require(:ingredient).permit(:name, :amount)
    end

end
