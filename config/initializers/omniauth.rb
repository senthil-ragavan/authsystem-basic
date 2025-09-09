# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           "557044989759-8n3c60sotuhpmlafl5sql38sef1h6or8.apps.googleusercontent.com",
           "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",
           scope: "email,profile",
           prompt: "select_account",
           access_type: "offline"
end

# omniauth-rails_csrf_protection gem automatically protects against CSRF attacks
# OmniAuth 2.0 expects the initial request to be a POST (recommended); keep your view's button as POST.
