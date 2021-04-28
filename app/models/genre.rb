class Genre < ApplicationRecord
    include Usable
    belongs_to :music 
    before_validation :build_parent
end
