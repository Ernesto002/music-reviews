class Artist < ApplicationRecord
    include Usable
    belongs_to :media 
    before_validation :build_parent
end
