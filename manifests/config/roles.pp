class bsl_jenkins::config::roles {
  augeas { 'config-authorizationStrategy':
    incl    => '/app/jenkins/config.xml',
    lens    => 'Xml.lns',
    changes => [
      'set hudson/authorizationStrategy/#attribute/class com.michelin.cio.hudson.plugins.rolestrategy.RoleBasedAuthorizationStrategy',
      'rm hudson/authorizationStrategy/roleMap',
      'rm hudson/authorizationStrategy/permission',
      'rm hudson/authorizationStrategy/#text',
    ],
  }
  ->
  class { 'bsl_jenkins::config::roles::global': }
  ->
  class { 'bsl_jenkins::config::roles::projects': }
  ->
  class { 'bsl_jenkins::config::roles::slaves': }


  $assignments = hiera('bsl_jenkins::config::roles')
  create_resources('bsl_jenkins::config::role', $assignments)
}
