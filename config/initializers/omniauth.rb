Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Rails.application.secrets.github_key,
    Rails.application.secrets.github_secret

  # There’s an issue with calling this action directly:
  # in development mode the action won’t always be reloaded so we’ve
  # wrapped the code in a lambda to stop the action being cached.
  provider :identity, :fields => [:nickname, :email],
    on_failed_registration: lambda { |env|
      IdentitiesController.action(:new).call(env)
    }
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
