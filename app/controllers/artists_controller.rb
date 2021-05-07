class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show]

  def index
    @artist = Artist.all
  end

  def new
  end

  def create
    artist = Artist.create(artist_params)
    return redirect_back fallback_location: new_artist_path, notice: artist.errors unless artist.errors.blank?
    redirect_to artist_path(artist)
  end

  def show
  end

  private

  def artist_params
    params.require(:artist).permit(:title)
  end

  def set_artist
    @artist = Artist.find_by(id: params[:id])
    return redirect_to new_artist_path unless @artist
  end
end
