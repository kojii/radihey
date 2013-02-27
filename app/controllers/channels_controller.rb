class ChannelsController < ApplicationController
  layout 'layouts/settings'
  before_filter :login_user_only, except: [:broadcast]

  def index
    @channels = login_user.channels.desc(:updated_at)
  end

  def broadcast
    render_404 unless @channel = current_user.channels.find(params[:channel_id])
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

    selected_buttons = Button.where(:_id.in => params_ch['button_ids'])
    button_texts = selected_buttons.map{|b| b.button_text}
    buttons = Button.where(:button_text_id.in => button_texts.map(&:id))

    case params_ch[:_type]
    when UstreamChannel.to_s
      @channel = UstreamChannel.new(params_ch)
    when RadikoChannel.to_s
      @channel = RadikoChannel.new(params_ch)
    else
      return render_404
    end
    @channel.owner = login_user

    @channel.button_sets.delete_all
    Persona.all.each do |persona|
      button_set = ButtonSet.new
      button_set.persona = persona
      buttons.each do |button|
        if persona == button.button_se.persona
          button_set.buttons << button
        end
      end
      @channel.button_sets << button_set
    end

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

    selected_buttons = Button.where(:_id.in => params[@channel.class.to_s.underscore]['button_ids'])
    button_texts = selected_buttons.map{|b| b.button_text}
    buttons = Button.where(:button_text_id.in => button_texts.map(&:id))
    @channel.button_sets.delete_all
    Persona.all.each do |persona|
      button_set = ButtonSet.new
      button_set.persona = persona
      buttons.each do |button|
        if persona == button.button_se.persona
          button_set.buttons << button
        end
      end
      @channel.button_sets << button_set
    end

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

  def get_buttons_by_persona
    channel = Channel.find(params['channel_id'])
    persona = Persona.find(params['persona_id'])
    buttons = Button.where(:button_se_id.in => ButtonSe.where(persona_id: persona.id).map(&:id)).order_by(:_id => :asc)
    render partial: 'components/buttons_for_edit_channel', locals: {buttons: buttons, channel: channel}
  end

  def get_selected_buttons_by_persona
    channel = Channel.find(params['channel_id'])
    persona = Persona.find(params['persona_id'])
    buttons = Button.where(:button_se_id.in => ButtonSe.where(persona_id: persona.id).map(&:id)).order_by(:_id => :asc)
    buttons = channel.button_sets.where(persona_id: persona.id).first.buttons
    render partial: 'components/buttons', locals: {buttons: buttons, channel: channel}
  end
end
