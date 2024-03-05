# Add a custom HTTP header with Puppet
exec {'update packages':
    command => ' sudo apt-get update',
    path    => ['/usr/bin', '/bin'],
}
package {'nginx':
    ensure => 'present',
}
exec {'append X-Served-By header':
    command => 'sudo sed -i "/listen \[::\]:80 default_server/a add_header X-Served-By $(hostname);" /etc/nginx/sites-available/default',
    path    => ['/usr/bin', '/bin'],
}
exec {'restart nginx':
    command => 'sudo service nginx restart',
    path    => ['/usr/bin', '/bin'],
}
