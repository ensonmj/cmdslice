class CommentsController < ApplicationController
  def create
    @slice = Slice.find(params[:slice_id])
    @comment = @slice.comments.new(comment_params)
    authorize @comment
    @comment.user = current_user
    @comment.save
    redirect_to slice_path(@slice)
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
