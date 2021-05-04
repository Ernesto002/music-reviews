class MediaController < ApplicationController 
    before_action :set_medium, only: %i[show]

    def index 
    end

    def show 
        case @medium.medium_type.downcase 
        when 'genre'
            redirect_to genre_path(@medium.element)
        when 'artist'
            redirect_to artist_path(@medium.element)
        when 'album' 
            redirect_to album_path(@medium.element)
        when 'song'
            redirect_to song_path(@medium.element)
        else
            redirect_back(fallback_location: root_path), notice: 'Something has gone wrong'
        end
    end

    private 

    def set_medium
        @medium = Medium.find_by(id: params[:id])
    end
end