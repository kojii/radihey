$ ->
  $('#channel__type_ustream_channel').bind 'click', ->
    $('#label-channel-ust-uid').css('display', 'block')
    $('#label-channel-station-id').css('display', 'none')
  $('#channel__type_radiko_channel').bind 'click', ->
    $('#label-channel-ust-uid').css('display', 'none')
    $('#label-channel-station-id').css('display', 'block')
