class CustomButtonsController < ApplicationController
  before_filter :channel_owner_only

  def index
    @custom_buttons = @channel.custom_buttons
  end

  def show
    @custom_button = @channel.custom_buttons.find(params[:id])
  end

  def new
    @custom_button = @channel.custom_buttons.build
  end

  def create
    @custom_button = @channel.custom_buttons.build(params[:custom_button])
    if @channel.custom_buttons << @custom_button
      render :create
    else
      render :new
    end
  end

  def edit
    @custom_button = @channel.custom_buttons.find(params[:id])
  end

  def update
    @custom_button = @channel.custom_buttons.find(params[:id])
    if @custom_button.update_attributes(params[:custom_button])
      render :update
    else
      render :edit
    end
  end

  def destroy
    @custom_button = @channel.custom_buttons.find(params[:id])
    @custom_button.destroy
  end

  private
  def channel_owner_only
    @channel = Channel.where(_id: params[:channel_id]).first
    return render_404 unless logged_in? and login_user.owner_of?(@channel)
  end
end
