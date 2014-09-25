class sudo {

	package { 'sudo': ensure => installed }

	define sudoer($nopasswd = false) {
		include sudo
		$sudoers_line = $nopasswd ? {
					true => "$name ALL=(ALL) NOPASSWD: ALL",
					false => "$name ALL=(ALL) ALL",
				}

		file { "/etc/sudoers.d/$name":
			content => $sudoers_line,
      owner => root,
      group => root,
			mode => 0440,
			require => Package['sudo'],
		}
	}

}
