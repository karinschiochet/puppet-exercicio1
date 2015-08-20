class websphere-mq {

   class { 'staging':
     path  => '/home/staging',
     owner => 'puppet',
     group => 'puppet',
  }

    staging::deploy { "WS_MQ_V8_0_TRIAL_LNX_ON_X86_64_ML.tar.gz":
      source => 'puppet:///modules/websphere-mq/WS_MQ_V8_0_TRIAL_LNX_ON_X86_64_ML.tar.gz',
      target => '/home/staging',
  }

  exec { "mq-accept":
    command => "/home/staging/mqlicense.sh -accept",
    require => Staging::Deploy["WS_MQ_V8_0_TRIAL_LNX_ON_X86_64_ML.tar.gz"],
  }

}
