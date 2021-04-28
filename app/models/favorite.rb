class Favorite < ApplicationRecord
  belongs_to :favoriter, class_name: 'User', foreign_key: :true
  belongs_to :medium
end
