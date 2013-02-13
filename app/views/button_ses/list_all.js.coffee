json = $.parseJSON('<%= @button_ses_json.html_safe %>')

options = []
$.each json, (i, val) ->
  option = $('<option>')
  option.html(val[0])
  option.attr('value', val[1])
  if val[2] == 'selected'
    option.attr('selected', 'true')
  options.push option

$('#custom_button_button_se_id').html(options)
$('.reload').html('<%= t ".reloaded" %>')
