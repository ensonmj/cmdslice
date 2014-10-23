class UserMailer < ActionMailer::Base
  default from: Rails.application.secrets.mail_from

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(identity)
    @identity = identity
    email_with_name = "#{identity.nickname} <#{identity.email}>"
    @greeting = "Hi #{identity.nickname}"
    mail to: email_with_name, subject: "Password Reset"
  end
end
