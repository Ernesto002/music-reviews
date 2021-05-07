class Song < ApplicationRecord
  include Usable
  include Favoritable
  include Reviewable
  belongs_to :album
  before_validation :build_parents
  validates :medium, presence: true, uniqueness: true
  validates :album, presence: true
  validates :title, presence: true
  validates_uniqueness_of :title, scope: :album
  scope :in_album, ->(album_id) { where(album_id: album_id) }
  scope :in_artist, ->(artist_id) { joins(:album).joins('LEFT JOIN artist ON albums.artist_id = artist.id').where('artist.id = ?', artist_id) }

  def parent
    album
  end
end
