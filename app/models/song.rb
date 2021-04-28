class Song < ApplicationRecord
    include Usable
    belongs_to :music 
    belongs_to :album
    belongs_to :artist
    belongs_to :genre                                       
    before_validation :build_parent
end
