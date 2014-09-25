class bsq-postgresql {
  class { 'postgresql::server':
    listen_addresses => '*',
  }
}
