class padrao {

  package { 'vim-enhanced' :
      ensure => installed,
  }

  package { 'GeoIP' :
      ensure => installed,
  }
}
