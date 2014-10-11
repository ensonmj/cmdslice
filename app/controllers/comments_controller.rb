class CommentsController < ApplicationController
  after_action :verify_authorized, :except => [:index, :show]

  def create
    @slice = current_user.slices.find(params[:slice_id])
    @comment = @slice.comments.new(comment_params)
    authorize @comment
    @comment.user = current_user
    @comment.save
    redirect_to slice_path(@slice)
  end

  def destroy
    @slice = current_user.slices.find(params[:slice_id])
    @comment = @slice.comments.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to slice_path(@slice)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
