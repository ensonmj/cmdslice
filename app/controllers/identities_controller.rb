require 'bcrypt'

class IdentitiesController < ApplicationController
  skip_after_action :verify_authorized, only: :new

  def new
    @identity = env['omniauth.identity']
  end

  def edit
  end

  def update
    @user = User.includes(:identity).find(params[:user_id])
    authorize @user
    @identity = @user.identity
    authorize @identity
    password = BCrypt::Password.new(@identity.password_digest)
    if password == params[:identity][:old_password]
      if @identity.update(update_params)
        flash[:notice] = "Change your password success"
      else
        flash[:error] = "Something error happend, please contact administrator"
      end
    else
      flash[:error] = "Please correct your old password"
    end
    redirect_to request.referer
  end

  private
  def update_params
    params.require(:identity).permit(:password, :password_confirmation)
  end
end
