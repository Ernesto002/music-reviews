class Genre < ApplicationRecord
    include Usable
    include Reviewable
    include Favoritable
    before_validation :build_parent
    validates :title, presence: true
end
