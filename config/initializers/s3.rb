module S3
  s3_yaml = YAML.load_file "#{Rails.root}/config/s3.yml"
  if Rails.env.production?
    s3_conf = s3_yaml['production']
  else
    s3_conf = s3_yaml['development']
  end
  HOST = "#{s3_conf['bucket']}.s3.amazonaws.com"
end
