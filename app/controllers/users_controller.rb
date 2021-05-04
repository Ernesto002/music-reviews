class UsersController < ApplicationController
  before_action :require_login, only: %i[update]
  before_action :set_user, only: %i[show update]
  def new
    @user = User.new
  end

  def show
    redirect_back unless @user 
  end

  def update 
    return redirect_to root_path, notice: 'You must be logged in as the correct user' inless current_user == @user
    current_user.update(user_params)
    current_user.save 
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
  
  def set_user 
    @user = User.find_by(id: params[:id])
  end

  def user_params 
    params.require(:user).permit(:username, :email, :password)
  end
end
