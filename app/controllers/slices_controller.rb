class SlicesController < ApplicationController
  include Commentable
  skip_after_action :verify_authorized, only: :show

  def index
    @slices = policy_scope(Slice).page(params[:page])
  end

  def create
    #render plain: params.inspect
    @slice = current_user.slices.new(slice_params)
    authorize @slice
    if @slice.save
      redirect_to current_user
    else
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
    #comment icon for comments, so don't need to eager load :commentable
    #@slice = Slice.includes(comments: [:user, :commentable]).order("created_at").find(params[:id])
    @slice = Slice.includes(comments: [:user]).order("created_at").find(params[:id])
    @comments = @slice.comments.page(params[:page])
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
    params.require(:slice).permit(:title, :body, :note)
  end
end
