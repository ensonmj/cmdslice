class Comment < ActiveRecord::Base
  #slice conflict with method name, use :cslice
  belongs_to :cslice, class_name: "Slice", foreign_key: "slice_id"
  belongs_to :user

  def user?(user)
    self.user == user
  end
end
