class SandboxEmailInterceptor
  def self.delivering_email(message)
    message.subject = "<To #{message.to}> #{message.subject}"
    message.to = Rails.application.secrets.mail_sandbox_to
  end
end

unless Rails.env.production?
  ActionMailer::Base.register_interceptor(SandboxEmailInterceptor)
end
