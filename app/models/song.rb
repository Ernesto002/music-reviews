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

  def parent
    album
  end
end
