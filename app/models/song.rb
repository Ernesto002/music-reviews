class Song < ApplicationRecord
    include Usable
    include Reviewable
    include Favoritable
    belongs_to :album                                   
    before_validation :build_parent
    validates :title, presence: true
end
