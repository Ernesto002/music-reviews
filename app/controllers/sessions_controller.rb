class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      self.current_user = user
      return redirect_to user_path(user)
    end
    redirect_to login_path, notice: 'Invalid login attempt'
  end

  def omni_create
    identity = Identity.find_or_create_with_omniauth(auth)
    if logged_in?
      if identity.user == current_user 
        redirect_to root_path, notice: 'Identity already exists.'
      # elsif identity.user 
        # notice to merge accounts
      else
        indentity.user = current_user
        identity.save 
        redirect_to root_path, notice: 'Identity linked!'
      end
    else
      if identity.user
        self.current_user = identity.user 
      else 
        user = User.create_with_omni(auth, identity)
        self.current_user = user
      end
      redirect_to user_path(user), notice: 'Signed in!'
    end
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
