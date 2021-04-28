module Usable 
    def build_parent
        self.build_music(music_type: self.class.to_s.to_sym) unless music_id
        if self.instance_of?(Song)
          self.build_album unless album_id
          self.album.build_artist unless album.artist_id
        end
        if self.instance_of?(Album)
          self.build_artist unless artist_id
        end
    end
end