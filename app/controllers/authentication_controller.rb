class AuthenticationController < ApplicationController
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def new
  end

  def login
    user = User.find_by(email: params[:username])

    if user&.authenticate(params[:password]) # if you're using has_secure_password
      session[:user_id] = user.id             # 🔑 maintain session
      redirect_to root_path, notice: "Logged in!"
    else
      flash.now[:alert] = "Invalid username or password"
      render :new, status: :unprocessable_entity
    end
  end

  def omniauth
    auth = request.env["omniauth.auth"]
    unless auth
      redirect_to login_path, alert: "No authentication data received."
      return
    end

    user = User.from_omniauth(auth)

    if user.persisted?
      session[:user_id] = user.id
      redirect_to root_path, notice: "Signed in with #{auth.provider.titleize}!"
    else
      # fallback: sign-in failed
      redirect_to login_path, alert: "Could not sign you in through #{auth.provider}."
    end
  rescue => e
    Rails.logger.error("Omniauth error: #{e.class} #{e.message}\n#{e.backtrace.join("\n")}")
    redirect_to login_path, alert: "Authentication error"
  end

  def omniauth_failure
    message = params[:message] || "Unknown error"
    redirect_to login_path, alert: "Authentication failed: #{message}"
  end
end
