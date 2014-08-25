class Authentication < ActiveRecord::Base
  validates_uniqueness_of :provider, scope: :user_id
  validates_uniqueness_of :uid, scope: :provider
  belongs_to :user
end
