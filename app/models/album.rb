class Album < ApplicationRecord
    include Usable
    belongs_to :media
    belongs_to :artist
    has_many :songs
    before_validation :build_parent
    validates :title, presence: true
end
