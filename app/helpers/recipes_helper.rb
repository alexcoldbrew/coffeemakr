module RecipesHelper

    def recipe_owner?(recipe)
        recipe.user == current_user
    end

end
