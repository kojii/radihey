class ChannelsController < ApplicationController
  layout 'layouts/settings'
  before_filter :login_user_only, except: [:broadcast]

  def index
    @channels = login_user.channels.desc(:updated_at)
  end

  def broadcast
    render_404 unless @channel = current_user.channels.find(params[:id])
    render layout: 'layouts/broadcast'
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
      redirect_to channels_path
    else
      render :new
    end
  end

  def edit
    return render_400 unless @channel = Channel.where(_id: params[:id]).first
  end

  def update
    @channel = login_user.channels.find(params[:id])
    if @channel.update_attributes(params[@channel.class.to_s.underscore])
      redirect_to edit_channel_path(@channel.id),
        flash: {notice: t('channels.update.saved',
                          path_to_broadcast_page: broadcast_channel_url(login_user.username, @channel.id, protocol: 'http'),
                         ).html_safe}
    else
      render :edit
    end
  end

  def destroy
    return render_400 unless @channel = Channel.where(_id: params[:id]).first
    @channel.destroy
    redirect_to channels_path
  end
end
