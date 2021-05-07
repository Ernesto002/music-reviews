class Genre < ApplicationRecord
    include Usable
    include Favoritable
    include Reviewable
    before_validation :build_parents
    validates :medium, presence: true, uniqueness: true
    validates :name, presence: true
end