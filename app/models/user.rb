class User < ApplicationRecord
    has_many :indentities
    has_many :reviews
    has_many :reviewed_media, through: :reviews, source: :medium
    has_many :favorites
    has_many :favorited_media, through: :favorites, source: :medium
    validates :username, uniqueness: true
    validates :email, uniqueness: true
    validates_with IdentityValidator 
    has_secure_password :validations false

    def self.create_with_omni(auth, identity)
        username = auth[:info][:nickname] || auth[:extra][:raw_info][:username]
        username = nil unless find_by(username: username).is_nil?
        user = self.new(username: username, email: auth[:info][:email])
        user.identities << identity
        user.save
        user
    end
end
