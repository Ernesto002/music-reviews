class Album < ApplicationRecord
  include Usable
  include Favoritable
  include Reviewable
  belongs_to :artist
  has_many :songs
  accepts_nested_attributes_for :songs
  before_validation :build_parents
  validates :medium, presence: true, uniqueness: true
  validates :artist, presence: true
  validates :title, presence: true
  validates_uniqueness_of :title, scope: :artist

  def children
    songs.blank? ? nil : songs
  end

  def parent
    artist
  end
end