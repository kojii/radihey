class RadiheyNode
  constructor: (@host, @button_ses) ->
    @socket = io.connect(@host)
    console.log(@socket)
    ws_client = @

    #### Handlers for UI
    ## 自分がボタンを押した。
    ## （このときのみ、HTMLタグに直接記述してあるonclickで音声を再生する。）
    $('.buttons-container').delegate '.click_target', 'click', (e) ->
      console.log('button_wrap_clicked')
      button_id = $(e.target).attr('data-button_id')
      ws_client.socket.emit('pushed-button', {'button_id': button_id})
      $('#logs textarea').prepend("ボタンを押しました\n")

    #### Handlers for WebSocket
    ## 他のユーザがボタンを押した。
    @socket.on 'another-pushed-button', (data) =>
      new Audio(@button_ses[data['button_id']]).play()
      $('#logs textarea').prepend("他のユーザがボタンを押しました\n")

    ## 自分が接続した。
    @socket.on 'joined', (data) ->
      $('.num-listeners').html(data.num_listeners)
      console.log('joined')
      $('#logs textarea').prepend("接続しました\n")

    ## 他のユーザが接続した。
    @socket.on 'another-connected', (data) ->
      $('.num-listeners').html(data.num_listeners)
      console.log('another-connected')
      $('#logs textarea').prepend("他のユーザが接続しました\n")

    ## 他のユーザが切断した。
    @socket.on 'another-disconnected', (data) ->
      $('.num-listeners').html(data.num_listeners)
      console.log('another-disconnected')
      $('#logs textarea').prepend("他のユーザが切断しました\n")

  change_button_ses: (button_ses) ->
    @button_ses = button_ses

window.RadiheyNode = RadiheyNode
