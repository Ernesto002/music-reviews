class Song < ApplicationRecord
    belongs_to :medium 
    belongs_to :album
    belongs_to :artist
    belongs_to :genre
    before_validation :build_parent
end
