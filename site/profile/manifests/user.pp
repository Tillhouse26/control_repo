class profile::user {

    #Active Users
    lookup('users::active', Hash, 'first', {}).each | $resource_title, $params| { 
        
        #Create the group
        group { $resource_title: 
            ensure => 'present',
            gid    => $params['gid'],
        }
        
        #Create the corresponding user
        user {
            default:
              ensure             => 'present',
              managehome         => 'true',
              password_max_age   => 900,
              password_min_age   => 7,
              password_warn_days => 7,
              shell              => '/bin/bash',;

             #Map the values from Hiera
             $resource_title: * => $params ;
         }
         
        #Create the home directory
        file { $params['home']: 
            ensure => 'directory',
            mode   => '0770',
            owner  => $resource_title,
            group  => $resource_title,
        }     
         
    }   

}
