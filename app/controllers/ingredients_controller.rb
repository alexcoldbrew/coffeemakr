class IngredientsController < ApplicationController

    def index
        @ingredients = Ingredient.all
    end

    def show
        @ingredient = Ingredient.find_by_id(params[:id])
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
            redirect_to @ingredient
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
