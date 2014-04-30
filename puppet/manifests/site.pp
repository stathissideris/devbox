# core modules
import 'puppetlabs-stdlib'
class { 'apt': }

# apt-get update
stage { 'preinstall': before => Stage['main'] }
class apt_get_update { exec { '/usr/bin/apt-get -y update': } }
class { 'apt_get_update': stage => preinstall }

package { 'curl' : ensure => present }
package { 'tmux' : ensure => present }
package { 'tree' : ensure => present }
package { 'htop' : ensure => present }
package { 'git'  : ensure => present }

package { 'emacs24-nox' : ensure => present }
package { 'emacs24-el' : ensure => present }

package { 'imagemagick' : ensure => present }

package { 'phantomjs' : ensure => present }

class leiningen {
  package { 'openjdk-7-jdk' : ensure => present }

  exec { 'lein' :
    command => '/usr/bin/wget -O /usr/bin/lein https://raw.github.com/technomancy/leiningen/stable/bin/lein',
    creates => '/usr/bin/lein',
  }

  file { 'lein chmod' :
    path => '/usr/bin/lein',
    ensure => present,
    mode => 0755,
    owner => root,
    require => Exec['lein'],
  }
}

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

class latex {
  package { 'texlive-latex-base' : ensure => present }
  package { 'texlive-latex-base-doc' : ensure => present }
  package { 'texlive-latex-extra' : ensure => present }
  package { 'texlive-latex-extra-doc' : ensure => present }
  package { 'texlive-latex-recommended' : ensure => present }
}

include leiningen
include wemux
include latex
