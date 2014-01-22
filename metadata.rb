maintainer       "Spanning Cloud Apps"
maintainer_email "devops@spanning.com"
license          "Apache 2.0"
version          "1.1.0"

recipe "jumpcloud::install_agent",        "Install JumpCloud agent"
recipe "jumpcloud::install_dependencies", "Install dependencies for the JumpCloud agent"
recipe "jumpcloud::tag_system",           "Assign JumpCloud tags to the system"

