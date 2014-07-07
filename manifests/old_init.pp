class OLDstadler_managerootuser_hiera_plain {

  $shadowpass = undef 

  case $::operatingsystem {
    default: {
      fail("this module does not support operating system ${::operatingsystem}")
    }
    'Ubuntu': {
      notify { "ubuntuhash = $::ubuntuhash":}
    }
    'CentOS': {
      notify { "centoshash = $::centoshash":}
    }
  }
  
  user { 'root':
    ensure           => hiera('managerootuser::ensure'),
    comment          => hiera('managerootuser::comment'),
    gid              => '0',
    home             => '/root',
    password         => $shadowpass,
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/bash',
    uid              => '0',
  }
}
