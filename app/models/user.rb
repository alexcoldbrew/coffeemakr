class User < ApplicationRecord
    has_many :recipes
    has_many :reviews
    has_many :reviewed_recipes, -> {distinct}, through: :reviews, source: :recipe
    has_secure_password
    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true

    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(12)
        end
    end

end
