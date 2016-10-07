class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method  :current_user, :current_band, :logged_in?, :login_user!, :ensure_logged_in

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login_user!(user)
    session[:session_token] = user[:session_token]
  end

  def logout_user!
    session[:session_token] = nil
  end

  def logged_in?
    if @current_user
      return true
    else
      nil
    end
  end

  def ensure_logged_in
    if @current_user.nil?
      redirect_to bands_url
    end
  end

  def current_band
    @current_band ||= Band.find_by_id(band[:id])
  end


end
