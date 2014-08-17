class CommentsController < ApplicationController
  def create
    @slice = Slice.find(params[:slice_id])
    @comment = @slice.comments.create(comment_params)
    redirect_to slice_path(@slice)
  end

  def destroy
    @slice = Slice.find(params[:slice_id])
    @comment = @slice.commnets.find(params[:id])
    @comment.destroy
    redirect_to slice_path(@slice)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
