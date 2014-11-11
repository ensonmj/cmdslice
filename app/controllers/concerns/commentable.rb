module Commentable
  extend ActiveSupport::Concern

  def comments
    find_parent
    @comment = @parent.comments.new(comment_params)
    authorize @comment
    @comment.user = current_user
    @comment.save
    #redirect_to slice_path(@slice)
    redirect_to @parent
  end

  #def destroy_comment
    #@comment = Comment.find(params[:id])
    #authorize @comment
    #@comment.destroy
    #redirect_to request.referer
  #end

  private
  def find_parent
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @parent = $1.classify.constantize.find(value)
      end
    end
  end
  def comment_params
    params.require(:comment).permit(:body)
  end
end
