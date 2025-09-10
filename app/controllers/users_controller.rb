class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def save
    Rails.logger.info "Params :: #{params.inspect}"
    user = User.new(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])
    flash.now[:alert] = "User is signedup" if user.save
    Rails.logger.info "Errors :: #{user.errors.inspect}"

    redirect_to login_path
  end
end
