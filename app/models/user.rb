class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :reviewed_media, through: :reviews 
    has_many :favorites
    has_many :favorited_media, through: :favorites
end
