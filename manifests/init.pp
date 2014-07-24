class myuglymodule {
  package { [ 'screen', 'vim', 'curl', 'htop', ]: ensure => 'installed' }

  exec { 'set motd':
    command  => 'echo "I am the motd" > /etc/motd',
    unless   => 'cat /etc/motd | grep the "motd"',
    provider => shell,
  }
  
  file { 'my script' :
    mode     => 0700,
    path     => '/root/myscript.sh',
    source   => 'puppet:///modules/myuglymodule/set_repo_and_user.sh',
  }

  exec { 'exec my script':
    command  => 'bash /root/myscript.sh',
    unless   => 'cat /etc/passwd | grep myuser',
    provider => shell,
    require  => File['my script'],
  }

}