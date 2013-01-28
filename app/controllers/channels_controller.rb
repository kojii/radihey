class ChannelsController < ApplicationController
  before_filter :login_user_only, except: [:index, :show]

  def index
  end

  def show
    render_404 unless  @channel = Channel.where(_id: params[:id]).first
  end

  def new
    @channel = Channel.new
  end

  def create
    case params[:channel][:_type]
    when "ustream_channel"
      @channel = UstreamChannel.new(params[:channel])
    when "radiko_channel"
      @channel = RadikoChannel.new(params[:channel])
    else
      return render_404
    end
    @channel.owner = login_user
    if @channel.save
      redirect_to channels_path(login_user.username)
    else
      render :new
    end
  end

  def edit
    return render_400 unless @channel = Channel.where(_id: params[:id]).first
  end

  def update
    @channel = Channel.where(_id: params[:id]).first
    type = @channel._type.underscore
    if @channel.update_attributes(params[type])
      redirect_to channels_path(login_user.username)
    else
      render :edit
    end
  end

  def destroy
    return render_400 unless @channel = Channel.where(_id: params[:id]).first
    @channel.destroy
    redirect_to channels_path(login_user.username)
  end
end
