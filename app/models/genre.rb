class Genre < ApplicationRecord
    belongs_to :medium 
    before_validation :build_parent
end
