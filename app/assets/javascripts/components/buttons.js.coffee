$ ->
  $('.click_target').bind 'click', ->
    $(this).prev().addClass('clicked')
    $(this).parent('.button_wrap').addClass('clicked')

  $('.button_label').bind 'animationend webkitAnimationEnd', ->
    $(this).removeClass('clicked')
    $(this).parent('.button_wrap').removeClass('clicked')
