class RegistrationConfirmController < ApplicationController
  skip_after_action :verify_authorized, only: :update

  # get /users/:user_id/registration_confirm/:id
  def edit
    @user = User.includes(:identity).find(params[:user_id])
    authorize @user
    @identity = @user.identity
    authorize @identity
    @identity.resend_registration_confirm
    flash[:notice] = "Confirm code will be sent to your register email soon."
  end

  # get /registration_confirm/:id
  def update
    @identity = Identity.includes(:user).find_by!(confirm_token: params[:id])
    if @identity.confirmed?
      redirect_to user_path(@identity.user), notice: "You have already confirmed."
    elsif @identity.confirm_sent_at < 2.hours.ago
      redirect_to user_path(@identity.user), alert: "Confirm code has expired.
       please request another code."
    elsif @identity.registration_confirm
      redirect_to user_path(@identity.user), notice: "You have confirmed, please enjoy yourself."
    else
      redirect_to root_path, alert: "You have access an invalid url."
    end
  end
end
