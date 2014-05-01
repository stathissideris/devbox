class wemux {
  vcsrepo { "/usr/local/share/wemux":
    ensure   => latest,
    source   => "git://github.com/zolrath/wemux.git",
    provider => git,
  }

  file { "/usr/local/bin/wemux":
    ensure => 'symlink',
    target => '/usr/local/share/wemux/wemux'
  }
}
