package { 'ntp':
  ensure => installed,
}

package { 'git':
  ensure => installed,
}

package { 'ruby':
  ensure => installed,
}

package { 'puppetserver':
  ensure => installed,
}

package { 'r10k':
  provider => 'gem',
  ensure   => installed,
}

service { 'puppetserver':
  ensure  => running,
  enable  => true,
  require => Package['puppetserver'],
}
