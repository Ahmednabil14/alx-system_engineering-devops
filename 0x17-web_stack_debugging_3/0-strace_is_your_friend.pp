# Fixes bad  extensions to  in the WordPress file .

exec { 'fix-wordpress':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php'
}
