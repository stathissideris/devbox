# core modules
import 'puppetlabs-stdlib'
class { 'apt': }

# apt-get update
stage { 'preinstall': before => Stage['main'] }
class apt_get_update { exec { '/usr/bin/apt-get -y update': } }
class { 'apt_get_update': stage => preinstall }

package { 'tmux' : ensure => present }
package { 'tree' : ensure => present }
package { 'htop' : ensure => present }
package { 'git'  : ensure => present }

package { 'emacs24-nox' : ensure => present }
package { 'emacs24-el' : ensure => present }

package { 'imagemagick' : ensure => present }

package { 'postgresql-9.3' : ensure => present }

#package { 'phantomjs' : ensure => present }

include leiningen
include opam
include wemux
include latex
include user
