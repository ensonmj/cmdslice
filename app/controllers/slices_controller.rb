class SlicesController < ApplicationController
  after_action :verify_authorized, :except => [:index, :show]

  def index
    @slices = Slice.includes(:user).order("updated_at desc").page(params[:page])
  end

  def create
    #render plain: params.inspect
    @slice = current_user.slices.new(slice_params)
    authorize @slice
    if @slice.save
      redirect_to current_user
    else
      flash[:error] = "Something error happened."
      render "new"
    end
  end

  def new
    @slice = Slice.new
    authorize @slice
  end

  def edit
    @slice = Slice.find(params[:id])
    authorize @slice
  end

  def show
    @slice = Slice.find(params[:id])
    @comments = @slice.comments.order("created_at").page(params[:page])
  end

  def update
    @slice = Slice.find(params[:id])
    authorize @slice
    if @slice.update(slice_params)
      redirect_to current_user
    else
      render "edit"
    end
  end

  def destroy
    @slice = Slice.find(params[:id])
    authorize @slice
    @slice.destroy

    redirect_to current_user
  end

  private
  def slice_params
    params.require(:slice).permit(:title, :text, :note)
  end
end
