class Profile < ActiveRecord::Base
  validates_format_of :email,
    :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i,
    :allow_blank => true
  belongs_to :user
end
