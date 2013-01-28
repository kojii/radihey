# -*- encoding:utf-8 -*-
class UserSessionsController < ApplicationController
  respond_to :html

  def new
    return redirect_to root_url( :protocol=> 'http' ) if login_user
    @user_session = UserSession.new
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
      return redirect_to root_path
    end
    # ログイン失敗
    render :action => :new , :notice => I18n.t("controllers.user_sessions.fail")
  end

  #
  # ログアウト
  #
  def destroy
    logout
    redirect_to root_url
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
