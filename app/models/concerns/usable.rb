module Usable
  def self.included(base)
    base.class_eval do 
      belongs_to :medium
    end
  end

 def build_parent
    build_medium(medium_type: self.class.to_s) unless medium_id
    # if instance_of?(Song)
    #   build_album unless album_id
    #   album.build_artist unless album.artist_id
    # end
    # build_artist if instance_of?(Album) && !artist_id
 end
end