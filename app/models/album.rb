class Album < ApplicationRecord
    include Usable
    include Reviewable, Favoritable
    belongs_to :artist
    has_many :songs
    before_validation :build_parent
    validates :title, presence: true
end
