module Favoritable 
    def self.included(base)
        has_many :favorites, through: :medium 
        has_many :favoriters, through: :medium
    end 
end