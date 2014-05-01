class opam {
  Exec {
    cwd => '/home/vagrant',
    environment => [ 'OPAMROOT=/home/vagrant/.opam' ],
  }

  package { ['ocaml', 'ocaml-native-compilers', 'opam'] : ensure => present }
  ->
  package { ['build-essential', 'curl', 'm4', 'zlib1g-dev', 'libssl-dev'] : ensure => present }
  ->
  exec { 'opam init' :
    command => '/bin/su -l vagrant -c "/usr/bin/opam init -y"',
    creates => '/home/vagrant/.opam',
  }
  ->
  exec { 'opam packages' :
    command => '/bin/su -l vagrant -c "/usr/bin/opam install -y base-threads base-unix utop async yojson core_extended core_bench cohttp cryptokit menhir merlin"',
    timeout => 0,
  }

  # utop needs this:
  #  eval `opam config env`
  # and then add the following lines (yes, with the hashes, except the last one):
  #use "topfind";;
  #thread;;
  #camlp4o;;
  #require "core.top";;
  #require "core.syntax";;
  # open Core.Std
}
