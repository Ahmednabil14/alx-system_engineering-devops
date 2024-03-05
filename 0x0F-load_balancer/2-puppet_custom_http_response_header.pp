# Add a custom HTTP header with Puppet
exec {'update packages':
    command => 'sudo apt-get update',
    path    => ['/usr/bin', '/bin'],
}
package {'nginx':
    ensure => 'present',
}
file_line {'add X-Served-By header':
  ensure  => present,
  path    => '/etc/nginx/sites-available/default',
  line    => 'add_header X-Served-By $hostname;',
  # line i will add my line after
  match   => 'listen \[::\]:80 default_server',
  require => Package['nginx'],
}
exec {'restart nginx' :
    command => 'sudo service nginx restart',
    path    => ['/usr/sbin', '/usr/bin'],
}
