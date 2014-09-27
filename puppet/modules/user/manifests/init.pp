class user {
  user { "sideris":
    ensure => present,
    home   => "/home/sideris",
    # mkpasswd -m sha-512 -s
    password => '$6$qo.P3EcJXCPw$oqDDqRtSBH47aPqXWbGfbPzRMYT5Ek7hqILIcwSr6baYqp9DqtyraI5vw6uftWaYO1pEZeGfJhOTNsBMWKjdd/',
    groups => ['users'],
    shell  => '/bin/bash',
    managehome => true,
  }
  ->
  sudo::sudoer { "sideris": }
  ->
  vcsrepo { '/home/sideris/dotfiles':
    ensure   => present,
    source   => 'git://github.com/stathissideris/dotfiles.git',
    provider => git,
    owner    => 'sideris',
    group    => 'users',
    revision => 'master',
  }
  ->
  file { '/home/sideris/dotfiles/bootstrap.sh':
    ensure => present,
    owner  => 'sideris',
    group  => 'users',
    mode   => 755,
    source => 'puppet:///modules/user/bootstrap.sh',
  }
  ->
  exec { 'inject dotfiles':
    command => '/home/sideris/dotfiles/bootstrap.sh',
    cwd     => '/home/sideris/dotfiles/',
    user    => 'sideris',
    creates => '/home/sideris/.emacs.d',
  }
}
