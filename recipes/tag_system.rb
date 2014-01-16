################################################################################
jc_cfg = data_bag_item("jumpcloud", "config")
################################################################################
execute "tag_system" do
  
  command "/usr/local/bin/jumpcloud-tag_system.sh"
  action  :nothing
  
end
################################################################################
template "/usr/local/bin/jumpcloud-tag_system.sh" do
  
  source   "jumpcloud-tag_system.sh.erb"
  mode     0500
  variables(
    :api_url => jc_cfg['api']['url']
  )
  notifies :run, resources(:execute => [ "tag_system" ])
  
end
