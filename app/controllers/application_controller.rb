class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :set_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user=(user)
    session[:user_id] = user&.id
    @current_user = user
  end

  def set_user(id = params[:user_id])
    @user = User.find_by(id: id)
  end

  def logged_in?
    !!current_user
  end

  def require_login
    return head(:forbidden) unless current_user
  end
end