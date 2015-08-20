node 'server02.lab01.local' {
    include role::jboss
    include ::syslog
	}

node 'server03.lab01.local' {
  include ::websphere-mq
  include ::padrao
  }
node 'server04.lab01.local' {
  include ::padrao
	}
node 'server05.lab01.local' {
  include role::logserver

  }

