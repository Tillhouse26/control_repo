class profile::ident {

    lookup('users::generic', Hash, 'first', {}).each | $resource_title, $params| { 
      user {

        default:
          ensure     => 'present',
          home       => "/home/${params['name']}",
          managehome => true, ;
         $resource_title: * => $params ;
      }
    }

}
