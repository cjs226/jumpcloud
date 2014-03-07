################################################################################
jc_cfg = data_bag_item("jumpcloud", "config")
################################################################################
# If run_as is set create a corresponding sudoers for the user
if jc_cfg['nagios_plugin']['run_as']
  
  template "/etc/sudoers.d/99-nagios-check_jumpcloud_tags" do
  
    source "nagios-check_jumpcloud_tags.sudoers.erb"
    mode   "440"
    variables(
      :run_as => jc_cfg['nagios_plugin']['run_as']
    )
  
  end
  
end
################################################################################
# Lay down the plugin
template "#{jc_cfg['nagios_plugin']['path']}/check_jumpcloud_tags.sh" do
  
  source   "check_jumpcloud_tags.sh.erb"
  mode     "500"
  variables(
    :api_url => jc_cfg['api']['url']
  )
  
end
