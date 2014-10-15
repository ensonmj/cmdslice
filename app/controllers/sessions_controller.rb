class SessionsController < ApplicationController
  def new
  end

  # after omniauth process /auth/:provider/callback(.format) success
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to user_path(user), notice: "Welcome #{user.nickname}"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out!"
  end

  # omniauth process /auth/:provider/callback(.format) failure
  def failure
    redirect_to login_path,
      alert: "Authentication failed, please try again."
  end
end
