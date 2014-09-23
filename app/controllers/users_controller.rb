class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @slices = @user.slices.order("updated_at desc").page(params[:page])
  end
end
