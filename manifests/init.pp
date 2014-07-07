class stadler_managerootuser_hiera_plain {

  $salt = hiera("managerootuser::plaintextsalt")
  $passwd= hiera("managerootuser::plaintextpasswd")

  case $::osfamily {
    default: {
      fail {"module not implemented for osfamily [{$::osfamily}]":}
    }
    'Debian': {
      $hash = pwd_for_shadow_debian($salt,$passwd)
    }
    'RedHat': {
      $hash = pwd_for_shadow_redhat($salt,$passwd)
    }
  }

  user { 'dan':
    ensure           => hiera('managerootuser::ensure'),
    comment          => hiera('managerootuser::comment'),
    home             => '/home/dan',
    password         => $hash,
    shell            => '/bin/bash',
  }

}
