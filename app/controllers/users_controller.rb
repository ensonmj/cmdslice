class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: :show

  def show
    @user = User.find(params[:id])
    @slices = @user.slices.includes(:user).page(params[:slice_page])
    @asks = @user.asks.includes(:user).page(params[:ask_page])
  end
end
