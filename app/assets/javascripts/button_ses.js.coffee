$ ->
  $('.play_se').bind 'click', ->
    audio = new Audio($(this).attr('data-sound-url'))
    audio.play()
