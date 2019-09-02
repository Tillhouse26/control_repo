class profile::ident {

$userlist = ['tillel','test']

$userlist.each | Integr $index  {
    file {"/home/sitadmin/$userlist[$integer].txt":
      ensure => present,
      content => "Test",
    }
  }
}
