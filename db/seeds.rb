# coding:utf-8

Channel.destroy_all

Station.delete_all
Station.create({code: 'tbs-radio',      name: 'TBSラジオ'})
Station.create({code: 'bunka-housou',   name: '文化放送'})
Station.create({code: 'nippon-housou',  name: 'ニッポン放送'})
Station.create({code: 'radio-nikkei',   name: 'ラジオNIKKEI'})
Station.create({code: 'dai1-radio',     name: '第1 ラジオ'})
Station.create({code: 'nikkei-dai2',    name: 'NIKKEI第2'})
Station.create({code: 'inter-fm',       name: 'InterFM'})
Station.create({code: 'tokyo-fm',       name: 'TOKYO FM'})
Station.create({code: 'j-wave',         name: 'J-WAVE'})
Station.create({code: 'radio-nippon',   name: 'ラジオ日本'})
Station.create({code: 'bayfm78',        name: 'bayfm78'})
Station.create({code: 'nack5',          name: 'NACK5'})
Station.create({code: 'fm-yokohama',    name: 'ＦＭヨコハマ'})
Station.create({code: 'housou-daigaku', name: '放送大学'})

ButtonImage.delete_all
bi_hee     = ButtonImage.create({name: 'hee',    image_file_name: 'button_hee.png',    image_clicked_file_name: 'button_hee_click.png'})
bi_hai     = ButtonImage.create({name: 'hai',    image_file_name: 'button_hai.png',    image_clicked_file_name: 'button_hai_click.png'})
bi_iine    = ButtonImage.create({name: 'iine',   image_file_name: 'button_iine.png',   image_clicked_file_name: 'button_iine_click.png'})
bi_ee      = ButtonImage.create({name: 'ee',     image_file_name: 'button_ee.png',     image_clicked_file_name: 'button_ee_click.png'})
bi_warai   = ButtonImage.create({name: 'warai',  image_file_name: 'button_warai.png',  image_clicked_file_name: 'button_warai_click.png'})
bi_majide  = ButtonImage.create({name: 'majide', image_file_name: 'button_majide.png', image_clicked_file_name: 'button_majide_click.png'})

Persona.delete_all
per_m1 = Persona.create({name: '男性1'})

ButtonSe.delete_all
dbs_hee    = DefaultButtonSe.create({name: 'へぇ〜',   persona_id: per_m1.id, audio_file_name: 'hee.wav'})
dbs_hai    = DefaultButtonSe.create({name: 'はい',     persona_id: per_m1.id, audio_file_name: 'hai.wav'})
dbs_iine   = DefaultButtonSe.create({name: 'いいね！', persona_id: per_m1.id, audio_file_name: 'iine.wav'})
dbs_ee     = DefaultButtonSe.create({name: 'え〜',     persona_id: per_m1.id, audio_file_name: 'ee.wav'})
dbs_warai  = DefaultButtonSe.create({name: '笑',       persona_id: per_m1.id, audio_file_name: 'warai.wav'})
dbs_majide = DefaultButtonSe.create({name: 'マジで！', persona_id: per_m1.id, audio_file_name: 'majide.wav'})

ButtonText.delete_all
btx_hee    = ButtonText.create({text: 'へぇ〜'})
btx_hai    = ButtonText.create({text: 'はい'})
btx_iine   = ButtonText.create({text: 'いいね！'})
btx_ee     = ButtonText.create({text: 'え〜'})
btx_warai  = ButtonText.create({text: '笑'})
btx_majide = ButtonText.create({text: 'マジで！'})

Button.delete_all
DefaultButton.create({name: 'へぇ〜',   button_text_id: btx_hee.id,    button_se_id: dbs_hee.id,    button_image_id: bi_hee.id})
DefaultButton.create({name: 'はい',     button_text_id: btx_hai.id,    button_se_id: dbs_hai.id,    button_image_id: bi_hai.id})
DefaultButton.create({name: 'いいね！', button_text_id: btx_iine.id,   button_se_id: dbs_iine.id,   button_image_id: bi_iine.id})
DefaultButton.create({name: 'え〜',     button_text_id: btx_ee.id,     button_se_id: dbs_ee.id,     button_image_id: bi_ee.id})
DefaultButton.create({name: '笑',       button_text_id: btx_warai.id,  button_se_id: dbs_warai.id,  button_image_id: bi_warai.id})
DefaultButton.create({name: 'マジで！', button_text_id: btx_majide.id, button_se_id: dbs_majide.id, button_image_id: bi_majide.id})
