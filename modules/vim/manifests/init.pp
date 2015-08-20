class vim {

    package { 'vim-enhanced':
      ensure => installed,
    }

  ->

    file {'vimrc':
      ensure => file,
      path   => '/root/.vimrc',
      source => 'puppet:///modules/vim/modelo_vimrc',
      File['vimrc'] {
        owner => 'root',
        group => 'root',
        mode  => '0644',
      }
    }
}
