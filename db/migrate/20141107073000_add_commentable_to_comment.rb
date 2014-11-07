class AddCommentableToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :commentable, polymorphic: true
    remove_reference :comments, :slice, index: true
  end
end
