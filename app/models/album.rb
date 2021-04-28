class Album < ApplicationRecord
    include Usable
    belongs_to :music 
    belongs_to :genre
    belongs_to :artist
    before_validation :build_parent
end
