class stadler_managerootuser_hiera_plain {
 
  $salt = hiera("managerootuser::plaintextsalt")
  $passwd= hiera("managerootuser::plaintextpasswd")

  $hash = plain_pwd_to_md5hash($salt,$passwd)
  # $hash = plain_test($passwd)
  notice ($hash)
  
  user { 'dan':
    ensure           => hiera('managerootuser::ensure'),
    comment          => hiera('managerootuser::comment'),
    home             => '/home/dan',
    password         => "${hash}",
    shell            => '/bin/bash',
  }
}
