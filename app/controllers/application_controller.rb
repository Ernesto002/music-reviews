class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user 
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def current_user=(user)
        session[:user_id] = user&.id
        @current_user = user
    end

    def logged_in?
        !!current_user
    end
end
