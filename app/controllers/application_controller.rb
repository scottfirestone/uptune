class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :validate_user_auth_token

  def current_user
    @current_user ||= User.find_by(uid: session[:uid]) if session[:uid]
  end

  def validate_user_auth_token
    if @current_user
      @current_user.validate_auth_token
    end
  end
end
