class DetailsController < ApplicationController
  def page
    redirect_to login_path, alert: "You must log in first" unless current_user.present?
  end

  def logout
    session.delete(:user_id)
    redirect_to login_path, notice: "Logged out!"
  end
end
