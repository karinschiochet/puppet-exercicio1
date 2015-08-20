class ntp {

  case $operatingsystem {
    centos, redhat, Fedora: { $service_name = 'ntpd' }
    debian, ubuntu: { $service_name = 'ntp' }
  }

  package { 'ntp' :
    ensure  => installed,
  }

  file { 'ntp.conf' :
    ensure  => file,
    path    => '/etc/ntp.conf',
    source  => "puppet:///modules/ntp/ntp.conf",
    require => Package['ntp'],

  File['ntp.conf']{
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
  }

  service { 'ntp':
    name   => $service_name,
    ensure => running,
    enable => true,
    require => Package['ntp'],
  }
}
