$ ->
  $('form .button_wrap .click_target').bind 'click', ->
    $('#custom_button_button_image_id').val($(this).attr('data-button_image_id'))
    $('.click_target').removeClass('active')
    $(this).addClass('active')

  $('#custom_button_button_label').bind 'keyup paste', ->
    $('.button_label').html($(this).val())
