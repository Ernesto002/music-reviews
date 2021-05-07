class GenresController < ApplicationController
  before_action :set_genre, only: %i[show]

  def index
    @genres = Genre.all
  end

  def new
  end

  def create
    genre = Genre.create(genre_params)
    return redirect_back fallback_location: new_genre_path, notice: genre.errors unless genre.errors.blank?
    redirect_to genre_path(genre)
  end

  def show
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def set_genre
    @genre = Genre.find_by(id: params[:id])
    return redirect_to new_genre_path unless @genre
  end
end