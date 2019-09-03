class profile::ident {
    
    #Active Users
    lookup('users::active', Hash, 'first', {}).each | $resource_title, $params| { 
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
    }   
    
    #inactive Users
    lookup('users::inactive', Tuple, 'first', {}).each| $user| { 
      user { $user:
          ensure             => 'absent',
      }
    }       
}
