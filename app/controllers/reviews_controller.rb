class ReviewsController < ApplicationController
    before_action :set_user, only: %i[index]
    before_action :require_login, only: %i[create]
    before_action only: %i[destroy edit update] do 
        :set_review
        :require_owner
    end

    def index 
        @reviews = @user.reviews
    end

    def create 
        review = Review.new(review_params)
        review.medium = Medium.find(params[:medium_id])
        review.save 
        redirect_to medium_path(review.medium)
    end

    def edit 
    end

    def update 
        @review.update(review_params)
        redirect_to medium_path(@review.medium)
    end

    def destroy 
        @review.destroy 
        redirect_back(fallback_location: root_path)
    end

    private 

    def review_params
        params.require(:review).permit(:content, :rating)
    end

    def require_owner 
        return head(:forbidden) unless current_user == @review.reviewer
    end

    def set_review 
        @review = Review.find_by(id: params[:id])
    end
end