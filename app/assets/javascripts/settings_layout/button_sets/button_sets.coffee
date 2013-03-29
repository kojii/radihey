$ ->
  # イメージダイアログを表示
  $(document).on "click", ".choose-image", (e) ->
    $("#image-dialog").modal("show")
    $("#image-dialog").data("selected", $(e.target).parents("tr").data("index"));
    false

  # Audioを削除
  $(document).on "click", ".audio .remove", (e) ->
    html = "<input type='file' name='audio' data-uploadpath=#{$(e.target).attr('href')}>"
    $(e.target).parents("td").empty().append(html)
    false

  # Audioを登録
  $(document).on "change", ".audio input", (e) ->
    file = e.target.files[0]
    # data URI scheme を取得する

    formData = new FormData
    formData.append("audio[audio]", file)
    xhr = new XMLHttpRequest
    path = $(e.target).data("uploadpath")
    xhr.open('POST', path, true)
    xhr.onloadend = (_e) ->
      tr = $(e.target).parents("tr")
      audio_file = JSON.parse(_e.target.responseText)
      console.log(audio_file)

      tr.find(".audio-id").val(audio_file._id)
      tr.find(".audio input").replaceWith("
      <span>#{file.name}</span>
      <a href='#{$(e.target).data('uploadpath')}' class='remove'>Ｘ</a>
      ");
      tr.find(".play > a").attr("href", audio_file.audio)

    # 送信する
    xhr.send(formData)

  # 試聴
  $(document).on "click", ".play > a", (e) ->
    audio = new Audio(e.currentTarget.href)
    audio.play()
    false

  # Imageを選択
  $(document).on "click", "#image-dialog .gallery img", (e) ->
    tr = $(".btn-row:eq(#{$('#image-dialog').data('selected')})")
    tr.find(".image img").attr("src", e.target.src)
    tr.find(".image-id").val($(e.target).data("button_image"))
    $("#image-dialog").modal("hide")

  # Imageを登録
  $(document).on "click", "#image-dialog .new .submit", (e) ->
    formData = new FormData
    $("#image-dialog .new input:file").each (i, file) ->
      formData.append(file.name, file.files[0])

    nameField = $("#image-dialog .new input:text")
    formData.append(nameField.attr("name"), nameField.val())

    xhr = new XMLHttpRequest
    path = $(e.target).data("uploadpath")
    xhr.open('POST', path, true)
    xhr.onloadend = (_e) ->
      $("#image-dialog .modal-body").replaceWith(_e.target.responseText)

    xhr.send(formData)
    false
