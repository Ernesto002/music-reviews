class Artist < ApplicationRecord
    include Usable
    include Favoritable
    include Reviewable
    has_many :albums
    has_many :songs, through: :albums
    before_validation :build_parents
    validates :medium, presence: true, uniqueness: true
    validates :name, presence: true
  
    def children
      albums.blank? ? nil : albums
    end
end