# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           ENV.fetch("GOOGLE_CLIENT_ID"),
           ENV.fetch("GOOGLE_CLIENT_SECRET"),
           scope: "email,profile",
           prompt: "select_account",
           access_type: "offline"
end

# omniauth-rails_csrf_protection gem automatically protects against CSRF attacks
# OmniAuth 2.0 expects the initial request to be a POST (recommended); keep your view's button as POST.
