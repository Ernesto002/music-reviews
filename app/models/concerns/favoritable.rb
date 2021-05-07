module Favoritable
  def self.included(base)
    base.class_eval do
      has_many :favorites, through: :medium
      has_many :favoriters, through: :medium
    end
  end
end