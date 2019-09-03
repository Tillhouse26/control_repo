class profile::ident {
    
    #Active Users
    lookup('users::active', Hash, 'first', {}).each | $resource_title, $params| { 
        
        #Create the group
        group { $params['name']: 
            ensure => 'present',
            gid    => $params['gid'],
        }
        
        #Create the corresponding user
        user {
            default:
              ensure             => 'present',
              managehome         => 'true',
              home               => "/home/${params['name']}",
              password_max_age   => 900,
              password_min_age   => 7,
              password_warn_days => 7,
              shell              => '/bin/bash',;

             #Map the values from Hiera
             $resource_title: * => $params ;
         }
         
        #Create the home directory
        file { '/home/$params['name']': 
            ensure => 'directory',
            mode   => '0770',
            owner  => '${params['name']}',
            group  => '${params['name']}',
        }
         
    }   
    
    #Inactive Users
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
