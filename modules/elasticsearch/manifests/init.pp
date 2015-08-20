class elasticsearch {

  yumrepo { 'elasticsearch-1.7':
    ensure          => 'present',
    descr           => 'Elasticsearch repository for 1.7.x packages',
    enabled         => '1',
    gpgcheck        => '1',
    gpgkey          => 'http://packages.elastic.co/GPG-KEY-elasticsearch',
    metadata_expire => '6h',
    baseurl         => 'http://packages.elastic.co/elasticsearch/1.7/centos',
  }

  ->

  package {'elasticsearch' :
      ensure  => installed,
  }

  ~>

  service {'elasticsearch' :
      ensure => running,
      enable => true,
  }
}

