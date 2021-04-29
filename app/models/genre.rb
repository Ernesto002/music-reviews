class Genre < ApplicationRecord
    include Usable
    include Reviewable, Favoritable
    before_validation :build_parent
    validates :title, presence: true
end
