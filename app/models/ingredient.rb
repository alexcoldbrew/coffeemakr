class Ingredient < ApplicationRecord
    has_and_belongs_to_many :recipes
    validates :name, presence: true
    validates :name, uniqueness: true

    scope :alphabetize, -> { order(:name) }
end
