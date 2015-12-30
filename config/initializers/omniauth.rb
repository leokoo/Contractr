Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['facebook_key'], ENV['facebook_secret'], scope: 'email', info_fields: 'email, name'
  provider :github, ENV['github_client_id'], ENV['github_client_secret']
  on_failure { |env| AuthenticationsController.action(:failure).call(env) }
end