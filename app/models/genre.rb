class Genre < ApplicationRecord
    include Usable
    include Reviewable
    include Favoritable
    before_validation :build_parent
    validates :medium_id, presence: true, uniqueness: true
    validates :title, presence: true
end
