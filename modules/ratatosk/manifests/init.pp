class ratatosk {
  file {
    '/home/wulff/publish.sh':
      source => 'puppet:///modules/ratatosk/publish.sh',
      mode => 755,
      owner => 'wulff',
      group => 'wulff';

    '/home/wulff/www':
      ensure => directory,
      mode => 755,
      owner => 'wulff',
      group => 'wulff';
    ['/home/wulff/www/laerdrupal.dk', '/home/wulff/www/psyke.org', '/home/wulff/www/ratatosk.net']:
      ensure => directory,
      mode => 755,
      owner => 'wulff',
      group => 'wulff',
      require => File['/home/wulff/www'];

    '/var/www/jekyll/laerdrupal.dk':
      ensure => '/home/wulff/www/laerdrupal.dk',
      owner => 'www-data',
      group => 'www-data',
      require => File['/home/wulff/www/laerdrupal.dk', '/var/www/jekyll'];
    '/var/www/jekyll/psyke.org':
      ensure => '/home/wulff/www/psyke.org',
      owner => 'www-data',
      group => 'www-data',
      require => File['/home/wulff/www/psyke.org', '/var/www/jekyll'];
    '/var/www/jekyll/ratatosk.net':
      ensure => '/home/wulff/www/ratatosk.net',
      owner => 'www-data',
      group => 'www-data',
      require => File['/home/wulff/www/ratatosk.net', '/var/www/jekyll'];

    '/var/www/cache':
      ensure => directory,
      mode => 755,
      owner => 'www-data',
      group => 'www-data',
      require => File['/var/www'];
    ['/var/www/cache/laerdrupal.dk', '/var/www/cache/psyke.org', '/var/www/cache/ratatosk.net']:
      ensure => directory,
      mode => 755,
      owner => 'www-data',
      group => 'www-data',
      require => File['/var/www/cache'];
  }
}
