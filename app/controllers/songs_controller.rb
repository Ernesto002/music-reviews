class SongsController < ApplicationController
  before_action :set_song, only: %i[show]
  def index
    @songs = Song.in_album(params[:album_id])
  end

  def new
  end

  def create
    song = Song.create(song_params)
    return redirect_back(fallback_location: new_song_path), notice: song.errors unless song.errors.blank?
    redirect_to song_path(song)
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
