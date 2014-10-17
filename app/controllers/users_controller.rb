class UsersController < ApplicationController
  after_action :verify_authorized

  def show
    @user = User.find(params[:id])
    authorize @user
    @slices = @user.slices.order("updated_at desc").page(params[:page])
  end
end
