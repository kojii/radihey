class RadiheyNode
  constructor: (@host, @buttons) ->
    @socket = io.connect(@host)
    client = @

    #### Handlers for UI
    ## 自分がボタンを押した
    $('.button_wrap .click_target').bind 'click', (e) =>
      console.log('button_wrap_clicked')
      button_id = $(e.target).attr('data-button_id')
      @socket.emit('pushed-button', {'button_id': button_id})
      new Audio(@buttons[button_id]).play()
      $('#logs textarea').prepend("ボタンを押しました\n")

    #### Handlers for WebSocket
    ## 他のユーザがボタンを押した
    @socket.on 'another-pushed-button', (data) =>
      new Audio(@buttons[data['button_id']]).play()
      $('#logs textarea').prepend("他のユーザがボタンを押しました\n")

    ## 自分が接続した
    @socket.on 'joined', (data) ->
      $('.num-listeners').html(data.num_listeners)
      console.log('joined')
      $('#logs textarea').prepend("接続しました\n")

    ## 他のユーザが接続した
    @socket.on 'another-connected', (data) ->
      $('.num-listeners').html(data.num_listeners)
      console.log('another-connected')
      $('#logs textarea').prepend("他のユーザが接続しました\n")

    ## 他のユーザが切断した
    @socket.on 'another-disconnected', (data) ->
      $('.num-listeners').html(data.num_listeners)
      console.log('another-disconnected')
      $('#logs textarea').prepend("他のユーザが切断しました\n")

window.RadiheyNode = RadiheyNode
