$ ->
  $('.buttons-container').delegate '.click_target', 'click', (e) ->
    $(e.target).prev().addClass('clicked')
    $(e.target).parent('.button_wrap').addClass('clicked')

  $('.buttons-container').delegate '.button_label', 'animationend webkitAnimationEnd', (e) ->
    $(e.target).removeClass('clicked')
    $(e.target).parent('.button_wrap').removeClass('clicked')
