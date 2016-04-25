class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :user_token

  def current_user
    @current_user ||= User.find_by(uid: session[:uid]) if session[:uid]
  end

  def user_token
    @user_token ||= session[:token]
  end
end
