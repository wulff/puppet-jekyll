class jekyll {
  package {
    'rubygems':
      ensure => present,
  }
  exec {
    'gem-install-jekyll':
      command => 'gem install jekyll',
      creates => '/var/lib/gems/1.8/specifications/jekyll-0.11.2.gemspec',
      require => Package['rubygems'];
  }
}
