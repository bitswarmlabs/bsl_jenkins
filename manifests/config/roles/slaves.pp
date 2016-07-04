class bsl_jenkins::config::roles::slaves {
  anchor { 'bsl_jenkins::config::roles::slaves::start': }
  ->
#  augeas { 'config-authorizationStrategy-slaveRoles':
#    incl    => '/app/jenkins/config.xml',
#    lens    => 'Xml.lns',
#    changes => [
#      # Defining Slave Roles
#      'defnode slaveRolesMap hudson/authorizationStrategy[#attribute/class="com.michelin.cio.hudson.plugins.rolestrategy.RoleBasedAuthorizationStrategy"] ""',
#      'set $slaveRolesMap/roleMap/#attribute/type slaveRoles',
#    ],
#  }
#  ->
    #  class { 'bsl_jenkins::config::roles::slaves::admins': }
    #  ->
  anchor { 'bsl_jenkins::config::roles::slaves::end': }
}
