class Recipe < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    has_and_belongs_to_many :ingredients
end
