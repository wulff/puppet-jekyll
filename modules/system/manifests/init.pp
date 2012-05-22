class system {
  file {
    '/home/wulff/.bash_aliases':
      source => 'puppet:///modules/system/bash_aliases',
      mode => 644,
      owner => 'wulff',
      group => 'wulff';
  }
}
