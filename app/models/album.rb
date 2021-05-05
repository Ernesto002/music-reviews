class Album < ApplicationRecord
    include Usable
    include Reviewable
    include Favoritable
    belongs_to :artist
    has_many :songs
    before_validation :build_parent
    validates :medium, presence: true, uniqueness: true
    validates :artist, presence: true
    validates :title, presence: true
    scope :in_artist, ->(artist_id) { where(artist_id: artist_id) }

    def title 
        "#{artist.name} - Album #{title}" if artist
    end

    def children 
        songs.blank? ? nil : songs
    end

    def parent 
        artist
    end
end
