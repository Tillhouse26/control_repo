class profile::ident {
    
    #Generic Users
    lookup('users::generic', Hash, 'first', {}).each | $resource_title, $params| { 
      user {
        default:
          ensure     => 'present',
          home       => "/home/${params['name']}",;
          
         #Map the values from Hiera
         $resource_title: * => $params ;
      }
    }    

}
