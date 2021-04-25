class Album < ApplicationRecord
    belongs_to :medium 
    belongs_to :genre
    belongs_to :artist
    before_validation :build_parent
end
