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
    '/etc/nginx/htpasswd':
      source => 'puppet:///modules/nginx/htpasswd',
      require => Package['nginx'];

    '/etc/nginx/sites-available/default':
      source => 'puppet:///modules/nginx/default.conf',
      require => Package['nginx'],
      notify => Service['nginx'];

    '/etc/nginx/sites-available/gere.mwu.dk.conf':
      source => 'puppet:///modules/nginx/gere.mwu.dk.conf',
      require => Package['nginx'];
    '/etc/nginx/sites-enabled/gere.mwu.dk.conf':
      ensure => '/etc/nginx/sites-available/gere.mwu.dk.conf',
      require => File['/etc/nginx/sites-available/gere.mwu.dk.conf'],
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
  }
}
