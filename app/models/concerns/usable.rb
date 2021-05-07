module Conceivable
  def self.included(base)
    base.class_eval do
      belongs_to :medium
    end
  end

  def build_parents
    build_medium(medium_type: self.class.to_s) unless medium_id
  end
end