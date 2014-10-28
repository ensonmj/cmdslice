module Tokenable
  extend ActiveSupport::Concern

  private
  # This method will take a column argument so that we can
  # have multiple tokens later if need be.
  def generate_token(column)
    loop do
      self[column] = SecureRandom.urlsafe_base64
      break unless self.class.exists?(column => self[column])
    end
  end
end
