class Medium < ApplicationRecord
  has_many :reviews
  has_many :reviewers, through: :reviews, source: :reviewer
  has_many :favorites
  has_many :favoriters, through: :favorites, source: :favoriter
  scope :reviewed -> { Medium.joins.reviews) }
  scope :not_reviewed -> { Medium.joins('LEFT JOIN reviews ON media.id = reviews.medium_id').where('reviews.medium_id IS NULL') }

  def element 
    medium_type.constantize.find_by(medium_id: id)
  end
end
