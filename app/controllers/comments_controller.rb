class CommentsController < ApplicationController
  def create
    @slice = current_user.slices.find(params[:slice_id])
    @comment = @slice.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to slice_path(@slice)
  end

  def destroy
    @slice = current_user.slices.find(params[:slice_id])
    @comment = @slice.comments.find(params[:id])
    @comment.destroy
    redirect_to slice_path(@slice)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
