class ChannelsController < ApplicationController
  before_filter :login_user_only, except: [:index, :show]

  def index
  end

  def show
    render_404 unless @channel = Channel.where(_id: params[:id]).first
  end

  def new
    case params[:type]
    when 'ustream'
      @channel = UstreamChannel.new
    when 'radiko'
      @channel = RadikoChannel.new
    else
      render_404
    end
  end

  def create
    params_ch =  params['ustream_channel'] || params['radiko_channel']
    case params_ch[:_type]
    when UstreamChannel.to_s
      @channel = UstreamChannel.new(params_ch)
    when RadikoChannel.to_s
      @channel = RadikoChannel.new(params_ch)
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
    if @channel.update_attributes(params[@channel.class.to_s.underscore])
      redirect_to channel_path(login_user.username, @channel.id)
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
