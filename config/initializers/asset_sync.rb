if defined?(AssetSync)
  AssetSync.configure do |config|
    config.fog_provider = 'AWS'
    config.aws_access_key_id = 'AKIAIXBIF6NFJAW6KPVQ'
    config.aws_secret_access_key = 'mg8g6DWMoL1WOFDi0/QwkoKeX3fDzQ6Ec5xV1C9P'
    config.fog_directory = 'radiheyrails-assets-kari'

    # Increase upload performance by configuring your region
    config.fog_region = 'ap-northeast-1'
    #
    # Don't delete files from the store
    # config.existing_remote_files = "keep"
    #
    # Automatically replace files with their equivalent gzip compressed version
    config.gzip_compression = true
    #
    # Use the Rails generated 'manifest.yml' file to produce the list of files to
    # upload instead of searching the assets directory.
    # config.manifest = true
    #
    # Fail silently.  Useful for environments such as Heroku
    # config.fail_silently = true
  end
end
