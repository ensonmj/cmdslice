class Ask < ActiveRecord::Base
  has_many :comments, :as => :commentable, :dependent => :destroy
  validates :title, presence: true, length: {minimum: 2}
  validates_presence_of :body
  belongs_to :user

  def user?(user)
    self.user == user
  end
end
