class SessionsController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def new
  end

  # after omniauth process /auth/:provider/callback(.format) success
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    if params[:remember_me]
      cookies[:auth_token] = { value: user.auth_token,
                               expires: 1.weeks.from_now.utc }
    else
      # browser doesn't delete session cookies if session restore used
      cookies[:auth_token] = { value: user.auth_token,
                               expires: 30.minutes.from_now.utc }
    end
    redirect_to user_path(user), notice: "Welcome #{user.nickname}"
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_path
  end

  # omniauth process /auth/:provider/callback(.format) failure
  def failure
    redirect_to login_path,
      alert: "Authentication failed, please try again."
  end
end
