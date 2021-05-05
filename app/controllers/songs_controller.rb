class SongsController < ApplicationController
  before_action :set_song, only: %i[show]

  def new
  end

  def create
    unless song.errors.blank?
      album = Album.find_by(id: params[:song][:album_id])
      return redirect_back(fallback_location: new_artist_album_song_path(artist_id: album.parent.id, album_id: album.id)), notice: song.errors
    end
  end

  def show 
  end

  private 

  def song_params 
    params.require(:song).permit(:title, :album_id)
  end

  def set_song 
    id = params[:song_id] || params[:id]
    @song = Song.find_by(id: id)
    return redirect_to new_song_path unless @song
  end
end
