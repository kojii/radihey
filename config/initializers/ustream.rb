module Ustream
  ust_yaml = YAML.load_file "#{Rails.root}/config/ustream.yml"
  if Rails.env.production?
    ust_conf = ust_yaml['production']
  else
    ust_conf = ust_yaml['development']
  end
  KEY = ust_conf['key']
end
