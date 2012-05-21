class munin {
  package {
    ['munin', 'munin-node', 'libwww-perl']:
      ensure => present;
  }

  service {
    'munin-node':
      enable => true,
      ensure => running,
      require => Package['munin-node'];
  }

  file {
    '/etc/munin/munin.conf':
      source => 'puppet:///modules/munin/munin.conf',
      require => Package['munin'];
    '/etc/munin/munin-node.conf':
      source => 'puppet:///modules/munin/munin-node.conf',
      require => Package['munin-node'],
      notify => Service['munin-node'];
    '/etc/munin/plugin-conf.d/nginx':
      source => 'puppet:///modules/munin/nginx.conf',
      require => Package['munin-node'],
      notify => Service['munin-node'];

    # https://github.com/munin-monitoring/contrib/tree/master/plugins/nginx

    '/usr/share/munin/plugins/nginx-combined':
      source => 'puppet:///modules/munin/nginx-combined.conf',
      mode => 755,
      require => Package['munin-node'];
    '/etc/munin/plugins/nginx_combined_localhost':
      ensure => '/usr/share/munin/plugins/nginx-combined',
      require => File['/usr/share/munin/plugins/nginx-combined'],
      notify => Service['munin-node'];
  }

  # disable plugins
  file {
    '/etc/munin/plugins/http_loadtime':
      ensure => absent,
      require => Package['munin-node'];
    '/etc/munin/plugins/nfs4_client':
      ensure => absent,
      require => Package['munin-node'];
    '/etc/munin/plugins/nfsd':
      ensure => absent,
      require => Package['munin-node'];
    '/etc/munin/plugins/nfsd4':
      ensure => absent,
      require => Package['munin-node'];
    '/etc/munin/plugins/uptime':
      ensure => absent,
      require => Package['munin-node'];
  }

#  file {
#    '/etc/munin/plugins/diskstats':
#      ensure => absent,
#      require => Package['munin-node'];
#    '/etc/munin/plugins/fw_packets':
#      ensure => absent,
#      require => Package['munin-node'];
#    '/etc/munin/plugins/iostat_ios':
#      ensure => absent,
#      require => Package['munin-node'];
#    '/etc/munin/plugins/munin_stats':
#      ensure => absent,
#      require => Package['munin-node'];
#    '/etc/munin/plugins/users':
#      ensure => absent,
#      require => Package['munin-node'];
#  }

  # enable plugins
  file {
    '/etc/munin/plugins/nginx_request':
      ensure => '/usr/share/munin/plugins/nginx_request',
      require => Package['munin-node'];
    '/etc/munin/plugins/nginx_status':
      ensure => '/usr/share/munin/plugins/nginx_status',
      require => Package['munin-node'];
  }
}
