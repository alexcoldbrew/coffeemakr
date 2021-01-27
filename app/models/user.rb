class User < ApplicationRecord
    has_many :recipes
    has_many :reviewed_recipes, through: :reviews, source: :recipe
end
