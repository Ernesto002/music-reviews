class Genre < ApplicationRecord
    include Usable
    belongs_to :media
    before_validation :build_parent
    validates :title, presence: true
end
