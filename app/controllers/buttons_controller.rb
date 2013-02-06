class ButtonsController < ApplicationController
  layout 'layouts/settings'

  def index
    @buttons = login_user.buttons.desc(:updated_at)
  end

  def show
    @button = login_user.buttons.find(params[:id])
  end

  def new
    @button = CustomButton.new
    @button_images = ButtonImage.all
  end

  def create
    @button = CustomButton.new(params[:custom_button])
    @button.owner = login_user
    if @button.save
      redirect_to buttons_path
    else
      @button_images = ButtonImage.all
      render :new
    end
  end

  def edit
    @button = login_user.buttons.find(params[:id])
    @button_images = ButtonImage.all
  end

  def update
    @button = login_user.buttons.find(params[:id])
    if @button.update_attributes(params[:custom_button])
      redirect_to edit_button_path(@button.id), flash: {notice: t('buttons.update.saved')}
    else
      @button_images = ButtonImage.all
      render :edit
    end
  end

  def destroy
    @button = login_user.buttons.find(params[:id])
    @button.destroy
    redirect_to buttons_path
  end
end
