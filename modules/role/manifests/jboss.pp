class role::jboss {
  include profile::java::jre
  include profile::jboss7

  Class['profile::java::jre'] -> Class['profile::jboss7']
}
