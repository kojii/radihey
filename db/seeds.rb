# coding:utf-8

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
ButtonImage.create({filename: 'button_hee.png'})
ButtonImage.create({filename: 'button_hai.png'})
ButtonImage.create({filename: 'button_iine.png'})
ButtonImage.create({filename: 'button_ee.png'})
ButtonImage.create({filename: 'button_warai.png'})
ButtonImage.create({filename: 'button_majide.png'})

DefaultButtonSe.delete_all
DefaultButtonSe.create({name: 'へぇ〜', audio: 'se_hee'})
DefaultButtonSe.create({name: 'はい', audio: 'se_hai'})
DefaultButtonSe.create({name: 'いいね！', audio: 'se_iine'})
DefaultButtonSe.create({name: 'え〜', audio: 'se_ee'})
DefaultButtonSe.create({name: '笑', audio: 'se_warai'})
DefaultButtonSe.create({name: 'マジで！', audio: 'se_majide'})
