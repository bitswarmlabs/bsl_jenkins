class bsl_jenkins::config::roles::global {
  augeas { 'config-authorizationStrategy-globalRoles':
    incl    => '/app/jenkins/config.xml',
    lens    => 'Xml.lns',
    changes => [
      # Defining Global Roles
      'defnode globalRolesMap hudson/authorizationStrategy[#attribute/class="com.michelin.cio.hudson.plugins.rolestrategy.RoleBasedAuthorizationStrategy"] ""',
      'set $globalRolesMap/roleMap/#attribute/type globalRoles',
    ],
    notify => Exec['jenkins-config-tidy'],
  }
  ->
  class { 'bsl_jenkins::config::roles::global::admin': }
  ->
  class { 'bsl_jenkins::config::roles::global::developer': }
  ->
  class { 'bsl_jenkins::config::roles::global::user': }
}
