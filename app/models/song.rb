class Song < ApplicationRecord
    include Usable
    belongs_to :media
    belongs_to :album                                   
    before_validation :build_parent
    validates :title, presence: true
end
