class ChangeCommenterToUserIdForComment < ActiveRecord::Migration
  def change
    add_reference :comments, :user, index: true
    remove_column :comments, :commenter
  end
end
