class ButtonSesController < ApplicationController
  layout 'layouts/settings'
  before_filter :login_user_only

  def index
    @button_ses = login_user.button_ses.desc(:updated_at)
  end

  def list_all
    button = Button.where(_id: params[:button_id]).first
    @button_ses_json = ButtonSe.where(_type: 'DefaultButtonSe').
      concat(login_user.button_ses.desc(:updated_at)).
      map{|s| [s.name, s.id, (button and button.button_se_id == s.id) ? 'selected' : '']}.
      to_json
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
    @button_se = login_user.button_ses.find(params[:id])
  end

  def update
    @button_se = login_user.button_ses.find(params[:id])
    if @button_se.update_attributes(params[:custom_button_se])
      redirect_to edit_button_se_path(@button_se.id), flash: {notice: I18n.t('button_ses.update.saved')}
    else
      render :edit
    end
  end

  def destroy
    @button_se = login_user.button_ses.find(params[:id])
    @button_se.destroy
    redirect_to button_ses_path
  end
end
