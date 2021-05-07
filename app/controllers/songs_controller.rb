class SongsController < ApplicationController
  before_action :set_song, only: %i[show]

  def new
  end

  def create
    song = Song.new(song_params)
    album = Album.find_by(id: params[:song][:album_id])
    song.album = album
    song.save
    unless song.errors.blank?
      return redirect_back fallback_location: album_path(params[:song][:album_id]), notice: song.errors 
    end
    redirect_to song_path(song)
  end

  def show
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end

  def set_song
    id = params[:song_id] || params[:id]
    @song = Song.find_by(id: id)
    return redirect_to new_song_path unless @song
  end
end
