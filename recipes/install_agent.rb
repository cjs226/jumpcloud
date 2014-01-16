################################################################################
jc_cfg      = data_bag_item("jumpcloud", "config")
xconnectkey = Chef::EncryptedDataBagItem.load("jumpcloud", "x-connect-key")
################################################################################
execute 'install_agent' do
  
  command "curl --header 'x-connect-key: #{xconnectkey['key']}' '#{jc_cfg['kickstart']['url']}' | sudo bash 2>&1 | logger -t jumpcloud-install_agent -i"
  path    [ '/sbin', '/bin', '/usr/sbin', '/usr/bin' ]
  timeout 600
  creates '/opt/jc'
  
end
################################################################################
# Init script to remove the instance from JumpCloud when shutdown
template "/etc/init.d/jumpcloud-remove_system" do
  
  source   "jumpcloud-remove_system.sh.erb"
  mode     0500
  variables(
    :api_url => jc_cfg['api']['url']
  )
  
end

link "/etc/rc0.d/K01jumpcloud-remove_system" do
  
  to "/etc/init.d/jumpcloud-remove_system"
  
end
