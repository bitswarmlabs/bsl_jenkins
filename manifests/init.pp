class bsl_jenkins(
  $plugins = undef
) inherits bsl_jenkins::params {
  class { '::jenkins':
    configure_firewall => false,
    cli                => true,
    plugin_hash        => $plugins,
  }

  $jenkins_home = $::jenkins::localstatedir
  $jenkins_user = $::jenkins::user

  file { '/usr/local/bin/jenkins-cli':
    content => template('bsl_jenkins/jenkins-cli.erb'),
    mode    => '0755',
  }

  exec { 'reload-jenkins-config':
    command     => 'jenkins-cli reload-configuration',
    path        => '/bin:/usr/bin:/usr/local/bin',
    refreshonly => true,
  }

  file { "/etc/facter/facts.d/jenkins.yaml":
    ensure  => file,
    content => template("bsl_jenkins/jenkins-facts.yaml.erb"),
    require => File['/etc/facter/facts.d/']
  }
}
