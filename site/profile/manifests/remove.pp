class profile::remove {

    #Remove Inactive Users
    lookup('users::inactive', Tuple, 'first', {}).each| $user| { 
        
        #Remove the group
        user { $user:
          ensure => 'absent',
        }
        
        #Remove the group
        group { $user: 
            ensure => 'absent',
        }
      }
 }
