module Reviewable
  def self.included(base)
    base.class_eval do
      has_many :reviews, through: :medium
      has_many :reviewers, through: :medium
    end
  end
end