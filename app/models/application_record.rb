class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def build_parent
    self.build_medium(media_type: self.class.to_sym) unless medium_id
    if self.instance_of?(Song)
      self.build_album unless album_id
      self.album.build_artist unless album.artist_id
    end
    if self.instance_of?(Album)
      self.build_artist unless artist_id
    end
  end
end