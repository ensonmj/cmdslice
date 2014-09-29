class UsersController < ApplicationController
  after_action :verify_authorized, :except => [:index, :show]

  def show
    @user = User.find(params[:id])
    @slices = @user.slices.order("updated_at desc").page(params[:page])
  end
end
