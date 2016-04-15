# == Class: hubot::params
#
# Default parameters for hubot.
# Private class
#
#
# === Authors
#
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
#
# === Copyright
#
# Copyright 2013 EvenUp.
#
class hubot::params {
  $hubot_version        = '2.18.0'
  $root_dir             = '/opt/hubot'
  $bot_name             = 'hubot'
  $display_name         = 'hubot'
  $chat_alias           = '/'
  $build_deps           = []
  $env_export           = {}
  $scripts              = []
  $external_scripts     = []
  $log_file             = undef
  $adapter              = 'shell'
  $dependencies         = { 'hubot' => '>= 2.6.0 < 3.0.0', 'hubot-scripts' => '>= 2.5.0 < 3.0.0' }
  $git_source           = undef
  $ssh_privatekey       = undef
  $ssh_privatekey_file  = undef
  $auto_accept_host_key = true
  $service_ensure       = 'running'
  $service_enable       = true
  $install_nodejs       = true

  case $::operatingsystem {
    /Ubuntu|Debian/: {
      $hubot_init         = "hubot.init.${::operatingsystem}.erb"
      $nodejs_manage_repo = true
      $hubot_init_dir     = '/etc/init.d/hubot'
    }
    /CentOS/: {
      $hubot_init         = 'hubot.service.erb'
      $nodejs_manage_repo = true
      $hubot_init_dir     = '/usr/lib/systemd/system'
    }
    default: {
      $hubot_init         = 'hubot.init.erb'
      $nodejs_manage_repo = false
      $hubot_init_dir     = '/etc/init.d/hubot'
    }
  }
}
