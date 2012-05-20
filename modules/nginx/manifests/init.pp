class nginx {
  package {
    'nginx':
      ensure => present,
  }

  service {
    'nginx':
      enable => true,
      ensure => running,
      require => Package['nginx']
  }

  file {
#    '/var/cache/nginx/':
#      ensure => directory;
    '/var/www':
      ensure => directory,
      mode => 775,
      owner => 'www-data',
      group => 'www-data';
    '/var/www/jekyll':
      ensure => directory,
      mode => 775,
      owner => 'www-data',
      group => 'www-data',
      require => File['/var/www'];

    '/etc/nginx/nginx.conf':
      source => 'puppet:///modules/nginx/nginx.conf',
      require => Package['nginx'],
      notify => Service['nginx'];

#    '/etc/nginx/sites-available/admin.conf':
#      source => 'puppet:///modules/nginx/admin.conf',
#      require => Package['nginx-light'];

#    '/etc/nginx/conf.d/fastcgi.conf':
#      source => 'puppet:///modules/nginx/fastcgi.conf',
#      require => Package['nginx-light'],
#      notify => Service['nginx'];
#    '/etc/nginx/conf.d/map_cache.conf':
#      source => 'puppet:///modules/nginx/map_cache.conf',
#      require => Package['nginx-light'],
#      notify => Service['nginx'];
#    '/etc/nginx/conf.d/microcache.conf':
#      source => 'puppet:///modules/nginx/microcache.conf',
#      require => Package['nginx-light'],
#      notify => Service['nginx'];
#    '/etc/nginx/conf.d/upstream.conf':
#      source => 'puppet:///modules/nginx/upstream.conf',
#      require => Package['nginx-light'],
#      notify => Service['nginx'];
#    '/etc/nginx/sites-available/drupal.conf':
#      source => 'puppet:///modules/nginx/drupal.conf',
#      require => Package['nginx-light'];
#    '/etc/nginx/htpasswd':
#      source => 'puppet:///modules/nginx/htpasswd',
#      require => Package['nginx-light'];

#    '/etc/nginx/sites-enabled/default':
#      ensure => absent,
#      require => Package['nginx'],
#      notify => Service['nginx'];

    '/etc/nginx/sites-available/default':
      source => 'puppet:///modules/nginx/default.conf',
      require => Package['nginx'],
      notify => Service['nginx'];

    '/etc/nginx/sites-available/laerdrupal.dk.conf':
      source => 'puppet:///modules/nginx/laerdrupal.dk.conf',
      require => Package['nginx'],
      notify => Service['nginx'];
    '/etc/nginx/sites-enabled/laerdrupal.dk.conf':
      ensure => '/etc/nginx/sites-available/laerdrupal.dk.conf',
      require => File['/etc/nginx/sites-available/laerdrupal.dk.conf'];

    '/etc/nginx/sites-available/psyke.org.conf':
      source => 'puppet:///modules/nginx/psyke.org.conf',
      require => Package['nginx'],
      notify => Service['nginx'];
    '/etc/nginx/sites-enabled/psyke.org.conf':
      ensure => '/etc/nginx/sites-available/psyke.org.conf',
      require => File['/etc/nginx/sites-available/psyke.org.conf'];

    '/etc/nginx/sites-available/ratatosk.net.conf':
      source => 'puppet:///modules/nginx/ratatosk.net.conf',
      require => Package['nginx'],
      notify => Service['nginx'];
    '/etc/nginx/sites-enabled/ratatosk.net.conf':
      ensure => '/etc/nginx/sites-available/ratatosk.net.conf',
      require => File['/etc/nginx/sites-available/ratatosk.net.conf'];

#    '/etc/nginx/sites-enabled/000-default':
#      ensure => '/etc/nginx/sites-available/default',
#     require => File['/etc/nginx/sites-available/default'];

#    '/etc/nginx/sites-available/cdn.conf':
#      source => 'puppet:///modules/nginx/cdn.conf',
#      require => Package['nginx-light'],
#      notify => Service['nginx'];
#    '/etc/nginx/sites-enabled/cdn.conf':
#      ensure => '/etc/nginx/sites-available/cdn.conf',
#      require => File['/etc/nginx/sites-available/cdn.conf'];

#    '/etc/nginx/sites-available/drupal7.conf':
#      source => 'puppet:///modules/nginx/drupal7.conf',
#      require => Package['nginx-light'],
#      notify => Service['nginx'];
#    '/etc/nginx/sites-enabled/drupal7.conf':
#      ensure => '/etc/nginx/sites-available/drupal7.conf',
#      require => File['/etc/nginx/sites-available/drupal7.conf'];
  }
}
