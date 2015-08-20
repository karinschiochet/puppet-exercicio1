class syslog {

  package {'syslog-ng':
    ensure =>  installed,
  }

  ->

  file { 'syslog-ng.conf':
    ensure => file,
    source => 'puppet:///modules/syslog/syslog-ng.conf',
    path   => '/etc/syslog-ng/syslog-ng.conf',
    owner  => 'root',
    group  => 'root',
    mode   =>  '0644',
  }

  ~>

  service { 'syslog-ng':
    ensure => running,
    enable => true,
  }
}
