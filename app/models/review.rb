class Review < ApplicationRecord
  belongs_to :reviewer, class_name: 'User', foreign_key: :user
  belongs_to :medium
end
