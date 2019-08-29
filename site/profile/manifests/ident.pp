class profile::ident {
  file {'/home/sitadmin/ident.txt':
    ensure => present,
    content => "Development node",
  }
}
