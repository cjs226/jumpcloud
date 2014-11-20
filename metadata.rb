name		 "jumpcloud"
maintainer       "Spanning Cloud Apps"
maintainer_email "devops@spanning.com"
license          "Apache 2.0"
description	 "JumpCloud binding"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.2.1"

recipe "jumpcloud::install_agent",        "Install JumpCloud agent"
recipe "jumpcloud::install_dependencies", "Install dependencies for the JumpCloud agent"
recipe "jumpcloud::nagios_plugin",        "Install Nagios plugin to verify connectivity to JumpCloud and that the system has been tagged"
recipe "jumpcloud::tag_system",           "Assign JumpCloud tags to the system"

