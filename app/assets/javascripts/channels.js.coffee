window.is_valid_ust_url = (url) ->
  r = url.match(/^http:\/\/www\.ustream\.tv\/channel\/([^\/]+).*/)
  if (r && r[1])
    true
  else
    false

window.change_ac_ust_submit = (show_warning=true) ->
  url = $('#ustream_channel_url').val()
  if window.is_valid_ust_url(url)
    $('.ac_ust_submit').removeClass('disabled')
    $('.invalid_url').removeClass('show')
  else
    $('.ac_ust_submit').addClass('disabled')
    $('.invalid_url').addClass('show') if show_warning

$ ->
  if $('#ustream_channel_url').length > 0
    window.change_ac_ust_submit(false)

  $('#ustream_channel_url').bind 'paste keyup', ->
    window.change_ac_ust_submit()

  $('.ac_ust_submit').click ->
    url = $('#ustream_channel_url').val()
    r = url.match(/^http:\/\/www\.ustream\.tv\/channel\/([^\/]+).*/)
    if (r)
      ust_uid = r[1]
      $.ajax {
        url: "http://api.ustream.tv/json/channel/"+ust_uid+"/getInfo",
        dataType: 'jsonp',
        jsonp: 'callback',
        timeout: 2000,
        success: (data, status) ->
          if $('#ustream_channel_title').val().length + $('#ustream_channel_description').val().length > 0
            return unless confirm('現在入力されている [チャンネルのタイトル] と [チャンネルの説明] が上書かれますが、よろしいですか？')

          $('#ustream_channel_title').val("#{data.title}")
          $('#ustream_channel_description').val("#{data.description}")
          $('#ustream_channel_url').val("#{data.url}")
          $('#preview').val("#{data.url}")
      }

  $('.click_target').bind 'click', ->
    $(this).prev().addClass('clicked')
    $(this).parent('.button_wrap').addClass('clicked')

  $('.button_label').bind 'animationend webkitAnimationEnd', ->
    $(this).removeClass('clicked')
    $(this).parent('.button_wrap').removeClass('clicked')

