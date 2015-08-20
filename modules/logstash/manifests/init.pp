class logstash {

  yumrepo { 'logstash-1.5':
    ensure          => 'present',
    descr           => 'Logstash repository for 1.5.x packages',
    enabled         => '1',
    gpgcheck        => '1',
    gpgkey          => 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch',
    metadata_expire => '6h',
    baseurl         => 'http://packages.elasticsearch.org/logstash/1.5/centos',
  }

  ->

  package {'logstash' :
      ensure  => installed,
  }

  ->

  file {'/etc/logstash/conf.d/central.conf':
      ensure => file,
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
      source => 'puppet:///modules/logstash/central.conf',
  }

  ~>
  service {'logstash' :
      ensure => running,
      enable => true,
  }
}
