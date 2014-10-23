class PasswordResetsController < ApplicationController
  def new
  end

  def create
    identity = Identity.find_by(email: params[:email])
    identity.send_password_reset if identity
    redirect_to root_url, notice: "Email sent with password reset instructions."
  end

  def edit
    # throw 404 if the user isn't found in production env.
    @identity = Identity.find_by!(password_reset_token: params[:id])
    if @identity.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, alert: "Password reset has expired,
       please request another reset."
    end
  end

  def update
    @identity = Identity.find_by!(password_reset_token: params[:id])
    if @identity.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, alert: "Password reset has expired.
       please request another reset."
    elsif @identity.update(update_params)
      redirect_to login_path, notice: "Password has been reset, you can log in
       with new password."
    else
      render :edit
    end
  end

  private
  def update_params
    params.require(:identity).permit(:password, :password_confirmation)
  end
end
