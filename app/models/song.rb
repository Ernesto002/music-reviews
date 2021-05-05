class Song < ApplicationRecord
    include Usable
    include Reviewable
    include Favoritable
    belongs_to :album                                   
    before_validation :build_parent
    validates :medium, presence: true, uniqueness: true
    validates :album, presence: true
    validates :title, presence: true
    validates_uniqueness_of :title, scope: :album
    scope :in_album, ->(album_id) { where (album_id: album_id) }
    scope :in_artist, ->(artist_id) { joins(:album).joins('LEFT JOIN artist ON albums.album_id = artitst.di').where('artist.id = ?', artist_id) }

    def parent 
        album
    end
end
