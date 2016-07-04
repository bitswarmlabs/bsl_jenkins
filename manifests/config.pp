class bsl_jenkins::config(
  $smtp_gateway = 'smtp',
  $workspace_dir = '${ITEM_ROOTDIR}/workspace',
  $builds_dir = '${ITEM_ROOTDIR}/builds',
  $thin_backup_path = '/app/backups',
  $update_center_url = 'http://updates.jenkins-ci.org/update-center.json',
) inherits bsl_jenkins::params {
  include 'bsl_jenkins'
  include '::cpan'

  package { 'expat-devel': }
  ->
  cpan { ['Carp','XML::XPath','XML::XPath::XMLParser','Math::BaseCnv']:
    ensure  => present,
  }
  ->
  cpan { "XML::Tidy":
    ensure  => present,
  }
  ->
  file { '/usr/local/bin/xmltidy':
    ensure => file,
    mode   => '775',
    source => 'puppet:///modules/bsl_jenkins/xmltidy',
  }

  exec { 'jenkins-config-tidy':
    command     => "/usr/local/bin/xmltidy /app/jenkins/config.xml '  '",
    refreshonly => true,
  }
  ~>
  file { '/app/jenkins/config.xml':
    ensure => file,
    audit  => content,
    notify => Exec['reload-jenkins-config']
  }
}
