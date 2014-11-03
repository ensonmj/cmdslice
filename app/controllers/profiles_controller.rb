class ProfilesController < ApplicationController
  def show
    @user = User.includes(:identity).find(params[:user_id])
    #identity maybe nil
    @identity = @user.identity
    @profile = @user.profile
    authorize @profile
  end
end
