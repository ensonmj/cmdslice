class User < ActiveRecord::Base
  include Tokenable

  validates_presence_of :nickname
  validates_uniqueness_of :email
  validates_format_of :email,
    :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications
  has_one :identity, :dependent => :destroy
  has_many :slices, :dependent => :destroy
  has_many :comments#, :dependent => :destroy
  before_create { generate_token(:auth_token) }

  def add_auth(auth)
    authentications.create(provider: auth[:provider], uid: auth[:uid])
  end

  # This method will take a column argument so that we can
  # have multiple tokens later if need be.
  #def generate_token(column)
    #loop do
      #self[column] = SecureRandom.urlsafe_base64
      #break unless User.exists?(column => self[column])
    #end
  #end

  class << self
    def from_omniauth(auth)
      locate_auth(auth) || locate_email(auth) || create_user(auth)
    end

    def locate_auth(auth)
      Authentication.find_by(provider: auth[:provider],
        uid: auth[:uid]).try(:user)
    end

    def locate_email(auth)
      user = find_by(email: auth[:info][:email])
      return unless user
      user.add_auth(auth)
      user
    end

    def create_user(auth)
      create! do |user|
        user.nickname = auth[:info][:nickname]
        user.email = auth[:info][:email]
        user.authentications_attributes = [
          {provider: auth[:provider], uid: auth[:uid]}
        ]
        # only affect user sign up with omniauth:identity
        user.identity = Identity.find_by(email: user.email)
      end
    end
  end
end
