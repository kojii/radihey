class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :logged_in?, :login_user, :login_user_only, :parse_message, :current_user

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

  def parse_message(temp, opt={ })
    return unless temp
    return if temp.blank?
    (ERB::Util.h temp).gsub(/(https?\:\/\/[-_.!~*\'()a-zA-Z0-9;\/?:\@&=+\$,%#]+)/,
                             "<a href='\\1' target='_blank'>\\1</a>").gsub(%r{(\r\n|\n)}, "<br/>").html_safe
  end

  def login_user_only
    return redirect_to root_path unless logged_in?
  end

  def render_404
    respond_to do |format|
      format.html { render template: 'errors/error_404', layout: 'layouts/application', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  def current_user
    return unless params[:username]

    # current_user がセットされていなければ、usernameからユーザを取得するのを試みる
    @current_user ||= User.find_by_symbol(params[:username])

    # ユーザが存在しなければ404に飛ばす
    return raise ActionController::RoutingError.new('Not Found') unless @current_user

    return @current_user
  end

end
