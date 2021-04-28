class Medium < ApplicationRecord
  has_one :genre
  has_one :artist
  has_one :album
  has_one :song
  has_many :reviews
  has_many :reviewers, through: :reviews, source: :reviewer
  has_many :favorites
  has_many :favoriters, through: :favorites, source: :favoriter

  def element 
    medium_type.constantize.find_by(medium_id: id)
  end
end
