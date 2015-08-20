class profile::jboss7 {

  class {'jboss':
    # install =>  'source',
    #version  =>  '6',
     absent   => true,
  }

    jboss::instance { 'jenkins':
   createuser => false, # Default user jboss is already created by jboss class
   bindaddr    => '10.10.10.2',
   port        => '8080',
  }

    contain ::jboss

}

