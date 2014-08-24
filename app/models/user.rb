class User < ActiveRecord::Base
  validates_presence_of :nickname
  validates_uniqueness_of :email
  validates_format_of :email,
    :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  has_many :authentications
  accepts_nested_attributes_for :authentications

  class << self
    def from_omniauth(auth)
      Authentication.find_by(provider: auth[:provider],
        uid: auth[:uid]).try(:user) || create_with_omniauth(auth)
    end

    def create_with_omniauth(auth)
      create! do |user|
        user.nickname = auth[:info][:nickname]
        user.email = auth[:info][:email]
        authentications_attributes = Authentication.new(
          provider: auth[:provider], uid: auth[:uid]).attributes
      end
      #create!(nickname: auth[:info][:nickname],
              #email: auth[:info][:email],
              #authentications_attributes: [
                #Authentication.new(provider: auth[:provider],
                                   #uid: auth[:uid]).attributes
              #])
    end
  end
end
