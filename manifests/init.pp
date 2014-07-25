class myuglymodule {
  package { [ 'screen', 'vim', 'curl', 'htop', ]: ensure => 'installed' }

  exec { 'set conf':
    command  => 'mkdir /etc/myapp && echo "I am the random config file" > /etc/myapp/conf',
    unless   => 'cat /etc/myapp/conf | grep "I am"',
    provider => shell,
  }
  
  file { 'my script' :
    mode     => 0700,
    path     => '/root/my_script.sh',
    source   => 'puppet:///modules/myuglymodule/my_script.sh',
  }

  exec { 'exec my script':
    command  => 'bash /root/my_script.sh',
    unless   => 'cat /etc/passwd | grep myuser',
    provider => shell,
    require  => File['my script'],
  }

}