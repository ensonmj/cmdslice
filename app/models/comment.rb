class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  def user?(user)
    self.user == user
  end
end
