class Recipe < ApplicationRecord
    belongs_to :user
    has_many :reviews
    has_many :users, through: :reviews
    has_and_belongs_to_many :ingredients
    validates :name, :description, :date_created, presence: true
end
