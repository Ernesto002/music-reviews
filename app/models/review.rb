class Review < ApplicationRecord
  belongs_to :reviewer, class_name: 'User', foreign_key: :user_id
  belongs_to :medium
  validates :content, presence: true, length: { minimum: 10 }

  scope :latest_reviews, -> {order(created_at: :desc).limit(3)}
end