class Favorite < ApplicationRecord
  belongs_to :favoriter, class_name: 'User', foreign_key: :user_id
  belongs_to :medium
  validates :favoriter, presence: true
  validates :medium, presence: true
  validates_uniqueness_of :favoriter, scope: :medium
end