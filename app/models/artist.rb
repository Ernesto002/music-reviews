class Artist < ApplicationRecord
  include Usable
  include Favoritable
  include Reviewable
  has_many :albums
  has_many :songs, through: :albums
  before_validation :build_parents
  validates :medium, presence: true, uniqueness: true
  validates :title, presence: true
  validates_uniqueness_of :title
  scope :alphabetical, -> {order('title')}

  def children
    albums.blank? ? nil : albums
  end
end