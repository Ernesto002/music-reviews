class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      return redirect_to user_path(@user)
    end
    redirect_to login_path, notice: 'Invalid login attempt'
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
