class bsq-postgresql {
  class { 'postgresql::server':
    listen_addresses  => '*',
    postgres_password => 'test',
  }

  postgresql::server::db { 'bsq':
    user     => 'sideris',
    password => postgresql_password('sideris', 'test'),
  }

  postgresql::server::pg_hba_rule { 'allow application network to access app database':
    description => "",
    type => 'hostnossl',
    database => 'all',
    user => 'sideris',
    address => 'all',
    auth_method => 'md5',
  }
}
