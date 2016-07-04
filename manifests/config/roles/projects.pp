class bsl_jenkins::config::roles::projects {
  anchor { 'bsl_jenkins::config::roles::projects::start': }
  ->
#  augeas { 'config-authorizationStrategy-projectRoles':
#    incl    => '/app/jenkins/config.xml',
#    lens    => 'Xml.lns',
#    changes => [
#      # Defining Project Roles
#      'defnode projectRolesMap hudson/authorizationStrategy[#attribute/class="com.michelin.cio.hudson.plugins.rolestrategy.RoleBasedAuthorizationStrategy"] ""',
#      'set $projectRolesMap/roleMap/#attribute/type projectRoles',
#    ],
#  }
#  ->
#  class { 'bsl_jenkins::config::roles::projects::admins': }
#  ->
  anchor { 'bsl_jenkins::config::roles::projects::end': }
}
