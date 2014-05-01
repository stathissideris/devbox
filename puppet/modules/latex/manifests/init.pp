class latex {
  package { 'texlive-latex-base' : ensure => present }
  package { 'texlive-latex-base-doc' : ensure => present }
  package { 'texlive-latex-extra' : ensure => present }
  package { 'texlive-latex-extra-doc' : ensure => present }
  package { 'texlive-latex-recommended' : ensure => present }
}
