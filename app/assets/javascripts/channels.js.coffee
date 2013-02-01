$ ->
  $('#channel__type_ustream_channel').bind 'click', ->
    $('#control-group-ust-uid').css('display', 'block')
    $('#control-group-station-id').css('display', 'none')
  $('#channel__type_radiko_channel').bind 'click', ->
    $('#control-group-ust-uid').css('display', 'none')
    $('#control-group-station-id').css('display', 'block')
