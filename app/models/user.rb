class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_media, through: :reviews, source: :medium
    has_many :favorites
    has_many :favorited_media, through: :favorites, source: :medium
    validates :username, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    has_secure_password
end
