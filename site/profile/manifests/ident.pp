class profile::ident {

$userlist = [{ user => "tillel", groups => ['wheel']  },
             { user => "sittest", groups => ['wheel']  },]

$userlist.each {
    file {'/home/sitadmin/$user.txt':
      ensure => present,
      content => "Test",
    }
  }
}
