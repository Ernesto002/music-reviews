class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      return redirect_to user_path(user)
    end
    redirect_to login_path, notice: 'Invalid login attempt'
  end

  def omni_create
    uid_type = "uid_#{auth[:provider].to_s}".to_sym
    user = User.find_by(uid_type auth[:uid])
    session[:user_id] = user.id
    return redirect_to user_path(user)
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
