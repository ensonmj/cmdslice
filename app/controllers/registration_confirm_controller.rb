class RegistrationConfirmController < ApplicationController
  def update
    @identity = Identity.includes(:user).find_by!(confirm_token: params[:id])
    if @identity.confirm_sent_at < 2.hours.ago
      redirect_to ruser_path(@identity.user), alert: "Confirm code has expired.
       please request another code."
    elsif @identity.registration_confirm
      redirect_to user_path(@identity.user), notice: "You have confirmed, please enjoy yourself."
    else
      redirect_to root_path, alert: "You have access an invalid url."
    end
  end
end