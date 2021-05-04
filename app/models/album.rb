class Album < ApplicationRecord
    include Usable
    include Reviewable
    include Favoritable
    belongs_to :artist
    has_many :songs
    before_validation :build_parent
    validates :artist, presence: true
    validates :title, presence: true

    def title 
        "#{artist.name} - Album #{title}"
    end
end
