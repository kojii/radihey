class UsersController < ApplicationController
  layout 'layouts/settings', only: [:edit, :update]

  def new
    return redirect_to root_path if logged_in?
    @user = User.new
  end

  def create
    if @user = User.create(params[:user])
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
    return render_404 unless login_user
    @user = login_user
  end

  def update
    return render_404 unless login_user
    if login_user.update_attributes(params[:user])
      render :update
    else
      @user = login_user
      flash.now[:notice] = I18n.t("controllers.users.create.invalid_parameter")
      render :edit
    end
  end

  def destroy
    return render_404 unless login_user
    login_user.leave
    if login_user.save
      redirect_to leaved_user_path
    else
      raise "Error"
    end
  end

  def leaved
  end
end
