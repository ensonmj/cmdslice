class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_user_got_comments

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user_got_comments
    if current_user
      total = 0
      current_user.slices.each do |slice|
        total += slice.comments.count
      end
      total
    else
      0
    end
  end
end
