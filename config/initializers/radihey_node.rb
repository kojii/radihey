module RadiheyNode
  radihey_node_yaml = YAML.load_file "#{Rails.root}/config/radihey_node.yml"
  if Rails.env.production?
    radihey_node_conf = radihey_node_yaml['production']
  else
    radihey_node_conf = radihey_node_yaml['development']
  end
  URL = radihey_node_conf['url']
end
