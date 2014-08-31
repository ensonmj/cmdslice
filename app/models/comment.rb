class Comment < ActiveRecord::Base
  #slice conflict with method name, use :cslice
  belongs_to :cslice, class_name: "Slice", foreign_key: "slice_id"
  belongs_to :commenter, class_name: 'User', foreign_key: 'user_id'
end
