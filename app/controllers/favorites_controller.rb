class FavoritesController  
    before_action :set_user, only: %i[index]
    before_action :require_login,  only: %i[create]
    before_action only: %i[destroy] do 
        set_favorite 
        require_owner
    end

    def index 
        @favorites = @user.favorites
    end

    def create 
        favorite = Favorite.new(favorite_params)
        favorite.medium = Favorite.find(params[:medium_id])
        favorite.favoriter = current_user 
        favorite.save 
        redirect_to medium_path(review.medium)
    end

    def destroy 
        @favorite.destroy 
        redirect_back(fallback_location: root_path)
    end

    private 

    def favorite_params 
        params.require(:favorite)
    end

    def require_owner 
        return head(:forbidden) unless current_user == @favorite.favoriter 
    end

    def set_favorite
        @favorite = Favorite.find_by(id: params[:id])
    end
end