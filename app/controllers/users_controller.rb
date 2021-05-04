class UsersController < ApplicationController
  before_action :require_login, only: %i[update]
  before_action :set_user, only: %i[show update]

  def new
    return redirect_to user_path(current_user) if current_user
    @user = User.new
  end

  def show
    redirect_back(fallback_location: root_path) unless @user
  end

  def update 
    return redirect_back(fallback_location: root_path), notice: 'You must be logged in as the correct user' inless current_user == @user
    current_user.update(user_params)
    redirect_to user_path(current_user)
  end

  def create
    user = User.new(user_params)
    if user.save
      self.current_user = user
      return redirect_to user_path(user)
    end
    redirect_to signup_path, notice: user.errors
  end

  private

  def user_params 
    params.require(:user).permit(:username, :email, :password)
  end
end
