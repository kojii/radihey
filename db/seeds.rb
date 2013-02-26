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
bi_hee     = ButtonImage.create({filename: 'button_hee.png',    name: 'hee'})
bi_hai     = ButtonImage.create({filename: 'button_hai.png',    name: 'hai'})
bi_iine    = ButtonImage.create({filename: 'button_iine.png',   name: 'iine'})
bi_ee      = ButtonImage.create({filename: 'button_ee.png',     name: 'ee'})
bi_warai   = ButtonImage.create({filename: 'button_warai.png',  name: 'warai'})
bi_majide  = ButtonImage.create({filename: 'button_majide.png', name: 'majide'})

ButtonSe.delete_all
dbs_hee    = DefaultButtonSe.create({name: 'へぇ〜'})
dbs_hai    = DefaultButtonSe.create({name: 'はい'})
dbs_iine   = DefaultButtonSe.create({name: 'いいね！'})
dbs_ee     = DefaultButtonSe.create({name: 'え〜'})
dbs_warai  = DefaultButtonSe.create({name: '笑'})
dbs_majide = DefaultButtonSe.create({name: 'マジで！'})

Button.delete_all
DefaultButton.create({name: 'へぇ〜',   button_label: 'へぇ〜',   button_se_id: dbs_hee.id,    button_image_id: bi_hee.id})
DefaultButton.create({name: 'はい',     button_label: 'はい',     button_se_id: dbs_hai.id,    button_image_id: bi_hai.id})
DefaultButton.create({name: 'いいね！', button_label: 'いいね！', button_se_id: dbs_iine.id,   button_image_id: bi_iine.id})
DefaultButton.create({name: 'え〜',     button_label: 'え〜',     button_se_id: dbs_ee.id,     button_image_id: bi_ee.id})
DefaultButton.create({name: '笑',       button_label: '笑',       button_se_id: dbs_warai.id,  button_image_id: bi_warai.id})
DefaultButton.create({name: 'マジで！', button_label: 'マジで！', button_se_id: dbs_majide.id, button_image_id: bi_majide.id})
