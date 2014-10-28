class Identity < OmniAuth::Identity::Models::ActiveRecord
  include Tokenable

  validates_presence_of :nickname
  validates_uniqueness_of :email
  validates_format_of :email,
    :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates_length_of :password, in: 6..20, on: :create
  belongs_to :user
  before_create do
    generate_token(:confirm_token)
    self[:confirm_sent_at] = Time.now.utc
  end
  after_create { send_registration_confirm }

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.now.utc
    save!
    UserMailer.password_reset(self).deliver
  end

  def send_registration_confirm
    UserMailer.registration_confirm(self).deliver
  end

  def registration_confirm
    self.confirmed_at = Time.now.utc
    save!
  end

  def confirmed?
    !self.confirmed_at.nil?
  end
end
