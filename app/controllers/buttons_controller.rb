class ButtonsController < ApplicationController
  before_filter :channel_owner_only

  def index
    @buttons = @channel.buttons
  end

  def show
    @button = @channel.buttons.find(params[:id])
  end

  def new
    @button = Button.new
  end

  def create
    @button = Button.new(params[:button])
    if @channel.buttons << @button
      render :create
    else
      render :new
    end
  end

  def edit
    @button = @channel.buttons.find(params[:id])
  end

  def update
    @button = @channel.buttons.find(params[:id])
    if @button.update_attributes(params[:button])
      render :update
    else
      render :edit
    end
  end

  def destroy
    @button = @channel.buttons.find(params[:id])
    @button.destroy
  end

  private
  def channel_owner_only
    @channel = Channel.where(_id: params[:channel_id]).first
    return render_404 unless login_user.owner_of?(@channel)
  end
end
