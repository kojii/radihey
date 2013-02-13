class UsersController < ApplicationController
  layout 'layouts/one_column'
  before_filter :login_user_only, only: [:edit, :update, :destroy]

  def new
    return redirect_to root_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to user_pre_registered_path(@user.id)
    else
      flash.now[:notice] = I18n.t("controllers.users.create.invalid_parameter")
      render :new
    end
  end

  def pre_registered
  end

  def activate
    render_404 unless user = User.where(pre_register_token: params[:pre_register_token], status: 'pre_registered').first
    user.activate
    if user.save
      redirect_to activated_path
    else
      raise "Error"
    end
  end

  def activated
  end

  def edit
    @user = login_user
    render layout: 'layouts/settings'
  end

  def update
    if login_user.update_attributes(params[:user])
      redirect_to edit_user_path(login_user.username), flash: {notice: I18n.t('users.update.saved')}
    else
      @user = login_user
      flash.now[:notice] = I18n.t("controllers.users.create.invalid_parameter")
      render :edit, layout: 'layouts/settings'
    end
  end

  def destroy
    login_user.leave
    if login_user.save
      redirect_to leaved_user_path
    else
      raise "Error"
    end
  end

  def leaved
    render layout: 'layouts/settings'
  end
end
