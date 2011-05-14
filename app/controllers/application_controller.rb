class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user

  def authenticate
    unless current_user
      redirect_to "/"
      return false
    end
  end

protected
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

end
