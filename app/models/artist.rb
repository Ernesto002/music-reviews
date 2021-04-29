class Artist < ApplicationRecord
    include Usable
    include Reviewable
    include Favoritable
    has_many :albums 
    has_many :songs, through: :albums
    before_validation :build_parent
    validates :name, presence: true
end
