class bsl_jenkins::config::roles::global::user {
  augeas { 'config-authorizationStrategy-globalRoles-user':
    incl    => '/app/jenkins/config.xml',
    lens    => 'Xml.lns',
    changes => [
      # Defining Global Roles
      'defnode globalRolesMap hudson/authorizationStrategy/roleMap[#attribute/type="globalRoles"] ""',

      # Defining the "user" role
      'defnode userRole $globalRolesMap/role[#attribute/name="user"] ""',
      'set $userRole/#attribute/name user',
      'set $userRole/#attribute/pattern .*',
      'set $userRole/permissions/permission[last()+1]/#text hudson.model.Hudson.Read',
      'set $userRole/permissions/permission[last()+1]/#text hudson.model.Item.Discover',
      'set $userRole/permissions/permission[last()+1]/#text hudson.model.Item.Read',
      'set $userRole/permissions/permission[last()+1]/#text hudson.model.View.Read',
    ],
    notify => Exec['jenkins-config-tidy'],
  }
}
