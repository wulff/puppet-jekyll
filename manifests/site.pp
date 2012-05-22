Exec { path => "/usr/sbin/:/sbin:/usr/bin:/bin" }
File { owner => 'root', group => 'root' }

node 'default' {
  import 'settings'

  include puppet
  include ssh
  include iptables
  include jekyll
  include git
  include gsl
  include htop
  include munin
  include ntp
  include nginx
  include ratatosk
  include system
}
