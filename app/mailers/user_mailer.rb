class UserMailer < ActionMailer::Base
  default from: Rails.application.secrets.mail_from

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(identity)
    @identity = identity
    @greeting = "Hi #{identity.nickname}"
    email_with_name = "#{identity.nickname} <#{identity.email}>"
    mail to: email_with_name, subject: "Password Reset"
  end

  def registration_confirm(identity)
    @identity = identity
    @greeting = "Hi #{identity.nickname}"
    email_with_name = "#{identity.nickname} <#{identity.email}>"
    mail to: email_with_name, subject: "Register confirm"
  end
end
