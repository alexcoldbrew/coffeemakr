class ReviewedRecipesController < ApplicationController

def index
    
    @reviewed_recipes = User.find_by(id: params[:user_id]).reviewed_recipes
end



end