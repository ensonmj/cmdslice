class UserMailer < ActionMailer::Base
  default from: Rails.application.secrets.mail_from

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    email_with_name = "#{user.nickname} <#{user.email}>"
    @greeting = "Hi #{user.nickname}"
    mail to: email_with_name, subject: "Password Reset"
  end
end
