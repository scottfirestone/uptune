class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:uid] = user.uid
      user.validate_auth_token
    else
      flash[:errors] = "There was a problem signing in."
    end
    redirect_to root_path
  end

  def destroy
    session.delete(:uid)
    @current_user = nil
    flash[:success] = "You have been logged out."
    redirect_to root_url
  end
end
