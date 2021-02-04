class Review < ApplicationRecord
    belongs_to :user
    belongs_to :recipe

    validates :content, :rating, presence: true
end
