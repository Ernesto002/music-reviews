class AlbumsController < ApplicationController
  before_action :set_album, only: %i[show]

  def new
  end

  def create
    album = Album.create(album_params)
    return redirect_back(fallback_location: new_artist_album_path(params[:album][:artist_id])), notice: album.errors unless album.errors.blank?
    redirect_to album_path(album)
  end

  def show
  end

  private 

  def album_params
    params.require(:album).permit(:title, :artist_id)
  end

  def set_album 
    id = params[:album_id] || params[:id]
    @album = Album.find_by(id: id)
    return redirect_to new_album_path unless @album
  end
end
