class Artist < ApplicationRecord
    include Usable
    include Reviewable
    include Favoritable
    has_many :albums 
    has_many :songs, through: :albums
    before_validation :build_parent
    validates :name, presence: true

    def children 
        albums.blank? ? nil : albums
    end
end
