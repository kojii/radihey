# -*- encoding:utf-8 -*-
class UserSessionsController < ApplicationController
  layout 'layouts/one_column'
  respond_to :html

  def new
    return redirect_to root_path if login_user
    @user_session = UserSession.new
    unless /^https?:\/\/#{RadiheyRails::HOST}\/user_sessions/ =~ request.referer
      session[:login_origin] = request.referer
    end
  end

  #
  # ログイン
  #
  def create
    @user_session = UserSession.new(params[:user_session])
    # ログイン成功
    if @user_session.save
      headers["P3P"] = "CP='IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT'"
      notice         = parse_message I18n.t "controllers.user_sessions.login"
      if session[:login_origin]
        redirect_to session[:login_origin]
        session.delete(:login_origin)
      else
        redirect_to home_path(login_user.username)
      end
    else
      # ログイン失敗
      render :action => :new , :notice => I18n.t("controllers.user_sessions.fail")
    end
  end

  #
  # ログアウト
  #
  def destroy
    logout
    redirect_to request.referer
  end

private
  def logout
    if login_user_session
      login_user_session.destroy
    end
    session.delete :access_token
    session.delete :origin_uri
    session.delete :access_token_secret
  end
end
