class Review < ApplicationRecord
  belongs_to :reviewer, class_name: 'User', foreign_key: :user
  belongs_to :medium
  validates :content, presence: true, length: { minimum: 10 }, uniqueness: true
end
