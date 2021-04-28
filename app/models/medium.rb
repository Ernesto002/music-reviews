class Medium < ApplicationRecord
  has_one :genre
  has_one :artist
  has_one :album
  has_one :song

  def element 
    medium_type.constantize.find_by(medium_id: id)
  end
end
