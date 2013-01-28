class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :logged_in?, :login_user

  private
  def logged_in?
    login_user.present?
  end

  def login_user(pop=false)
    return @login_user if defined?(@login_user) && @login_user
    return @login_user = login_user_session.user if login_user_session && login_user_session.user
    @login_user
  end

  def login_user_session
    return @login_user_session if defined?(@login_user_session) && @login_user_session
    begin
      return @login_user_session if @login_user_session = UserSession.find
    rescue Exception => e
    end
    @login_user_session
  end
end
