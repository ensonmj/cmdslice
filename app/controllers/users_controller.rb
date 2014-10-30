class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: :show

  def show
    @user = User.find(params[:id])
    @slices = @user.slices.order("updated_at desc").page(params[:page])
  end
end
