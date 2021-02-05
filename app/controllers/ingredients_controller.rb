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

    # can change this to only let an admin edit/update/delete ingredients if wanted..

    def edit
        @ingredient = Ingredient.find_by_id(params[:id])
    end

    def update
        @ingredient = Ingredient.find_by_id(params[:id])
        if @ingredient.update(ingredients_params)
            redirect_to ingredient_path(@ingredient)
        else
            render :edit
        end
    end

    def destroy
        @ingredient = Ingredient.find_by_id(params[:id])
        @ingredient.destroy
        redirect_to ingredients_path
    end

    private

    def ingredients_params
        params.require(:ingredient).permit(:name, :amount)
    end

end
