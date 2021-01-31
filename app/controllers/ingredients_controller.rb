class IngredientsController < ApplicationController

    def index
        @ingredients = Ingredient.all
    end

    def show
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.create(ingredient_params)
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
