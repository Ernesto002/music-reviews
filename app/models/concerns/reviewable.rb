module Reviewable 
    def self.included(base)
        has_many :reviews, through: :medium 
        has_many :reviewers, through: :medium
    end
end