class ApplicationController < ActionController::Base
  include Pundit
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  before_action :set_locale

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from Pundit::NotConfirmedError, with: :user_not_confirmed
  rescue_from Pundit::NotImplementedError, with: :policy_not_implemented

  private
  def current_user
    @current_user ||= User.find_by(auth_token: cookies[:auth_token]) if cookies[:auth_token]
  end

  # exception has query, record, and policy properties
  def user_not_authorized(exception)
    redirect_to(request.referer||login_path,
                flash: {error: "You are not authorized to perform this action."})
  end

  def user_not_confirmed(exception)
    redirect_to(request.referer||user_path(exception.user),
                alert: "Please confirm your account.")
  end

  def policy_not_implemented(exception)
    redirect_to(request.referer||root_path, alert: exception.to_s)
  end

  # locale setting
  def set_locale
    if ["en", "zh"].include?(params[:locale])
      I18n.locale = params[:locale]
    else
      I18n.locale = extract_locale_from_request || I18n.default_locale
    end
  end

  def extract_locale_from_request
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { locale: ["en", "zh"].include?(params[:locale]) ? params[:locale] : nil }
  end
end
