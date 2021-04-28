class Artist < ApplicationRecord
    include Usable
    belongs_to :media 
    has_many :albums 
    has_many :songs, through: :albums
    before_validation :build_parent
    validates :name, presence: true
end
