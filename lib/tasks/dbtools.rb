namespace :dbtools do
  LOCAL_DATABASE_NAME = "radihey_rails_development"
  REMOTE_DATABASE_NAME = "radihey"
  USER = "radihey"
  PW = "1D1AktDa"
  HOST = "ds053937.mongolab.com:53937"

  desc "sync the local db with the db on Mongolab"
  # MongolabからDBデータをダウンロードしてローカルのDBに流す。
  # ローカルDBの内容はbackupディレクトリに退避させる。
  task "pull" do
    puts "start"
    `mkdir -p db/dbtools/backups`
    `mkdir -p db/dbtools/latest`
    puts "making a backup data: Start"
    `mongodump -d #{LOCAL_DATABASE_NAME} -o db/dbtools/backups/#{Time.new.strftime('%Y%m%d%H%M%S')}`
    puts "making a backup data: Done"
    puts
    puts "mongodump on Mongolab: Start"
    `mongodump -h #{HOST} -d #{REMOTE_DATABASE_NAME} -u #{USER} -p #{PW} -o db/dbtools/latest`
    puts "mongodump on Mongolab: Done"

    puts "mongorestore on local started..."
    `mongorestore -d #{LOCAL_DATABASE_NAME} --drop db/dbtools/latest/#{REMOTE_DATABASE_NAME}`

    puts 'done.'
  end

  # rollbackディレクトリに退避してあるダンプをDBに流す
#  task "rollback_db" do
#    if File.exist?("db/heroku_sync_db/rollback/#{LOCAL_DATABASE_NAME}")
#      `mongorestore -d #{LOCAL_DATABASE_NAME} --drop db/heroku_sync_db/rollback/#{LOCAL_DATABASE_NAME}`
#    else
#      puts "no backup file for rollback."
#    end
#  end
#
  # 現在のDBの内容バックアップする
  task "backup" do
    puts "start"
    `mkdir -p db/dbtools/backups`
    `mkdir -p db/dbtools/latest`
    puts "making a backup data: Start"
    `mongodump -d #{LOCAL_DATABASE_NAME} -o db/dbtools/backups/#{Time.new.strftime('%Y%m%d%H%M%S')}`
    puts "making a backup data: Done"
  end
end

