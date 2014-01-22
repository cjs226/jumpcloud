JumpCloud Cookbook
==================

This cookbook installs the JumpCloud agent and employs the agent to:
* tag the system
* remove the system from JumpCloud when the system is shutdown

All activity is logged to syslog.

Recipes
=======

install_agent
-------------

Installs the agent as well as an init script to remove the system from JumpCloud
upon shutdown and uninstall the agent.

install_dependencies
--------------------

Installs dependencies required by JumpCloud.

tag_system
----------

Tags the system with:
* the system's Chef environment IF it exists as a tag in JumpCloud
* the tags assigned to the system's role

Platform
========

Tested on Ubuntu 12.04 and Chef 11.4.0.

Setup
=====

You need to setup a data bag named jumpcloud with a 'config' data bag item:

    "id":        "config",
    "api":       {
      "url": "https://console.jumpcloud.com/api"
    },
    "kickstart": {
      "url":           "https://kickstart.jumpcloud.com/Kickstart"
    }

and a 'x-connect-key' **encrypted** data bag item:

    "id":  "x-connect-key",
    "key": "0123456789"
  
Replace the key with your x-connect-key which can be found in the JumpCloud
console in any of the installation methods listed under Systems.

Usage
=====

Add the recipes and set tags as attributes in a role:

    name "sandbox"
    description "Sandbox servers"

    run_list(
      "recipe[jumpcloud::install_dependencies]",
      "recipe[jumpcloud::install_agent]",
      "recipe[jumpcloud::tag_system]"
    )

    default_attributes(
      "jumpcloud" => {
        "tags" => ["administrators","developers"]
      }
    )
  
## License and Author

Author: Clif Smith(clif@spanning.com)

Copyright 2014, Spanning Cloud Apps, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
