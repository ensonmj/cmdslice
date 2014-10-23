class Identity < OmniAuth::Identity::Models::ActiveRecord
  validates_presence_of :nickname
  validates_uniqueness_of :email
  validates_format_of :email,
    :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates_length_of :password, in: 6..20, on: :create
  belongs_to :user

  # This method will take a column argument so that we can
  # have multiple tokens later if need be.
  def generate_token(column)
    loop do
      self[column] = SecureRandom.urlsafe_base64
      break unless Identity.exists?(column => self[column])
    end
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.now.utc
    save!
    UserMailer.password_reset(self).deliver
  end
end
