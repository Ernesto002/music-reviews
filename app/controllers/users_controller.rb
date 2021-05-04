class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def new
    @user = User.new
  end

  def show
    redirect_back unless @user 
  end

  def update 
    return redirect_to root_path, notice: 'You must be logged in as the correct user' inless current_user == @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      return redirect_to user_path(@user)
    end
    return redirect_to signup_path
  end

  private
  
  def set_user 
    @user = current_user
  end

  def user_params 
    params.require(:user).permit(:username, :email, :password)
  end
end
