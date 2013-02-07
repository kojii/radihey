class ButtonSesController < ApplicationController
  layout 'layouts/settings'

  def index
    @button_ses = login_user.button_ses.custom.desc(:updated_at)
  end

  def new
    @button_se = CustomButtonSe.new
  end

  def create
    @button_se = CustomButtonSe.new(params[:custom_button_se])
    if @button_se.save
      login_user.button_ses << @button_se
      login_user.save
      redirect_to button_ses_path
    else
      render :new
    end
  end

  def edit
    @button_se = login_user.button_ses.custom.find(params[:id])
  end

  def update
    @button_se = login_user.button_ses.custom.find(params[:id])
    if @button_se.update_attributes(params[:custom_button_se])
      redirect_to edit_button_se_path(@button_se.id), flash: {notice: I18n.t('button_ses.update.saved')}
    else
      render :edit
    end
  end

  def destroy
    @button_se = login_user.button_ses.custom.find(params[:id])
    @button_se.destroy
    redirect_to button_ses_path
  end
end
