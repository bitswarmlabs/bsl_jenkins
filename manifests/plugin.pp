#
# config_filename = undef
#   Name of the config file for this plugin.
#
# config_content = undef
#   Content of the config file for this plugin. It is up to the caller to
#   create this content from a template or any other mean.
#
# update_url = undef
#
# source = undef
#   Direct URL from which to download plugin without modification.  This is
#   particularly useful for development and testing of plugins which may not be
#   hosted in the typical Jenkins' plugin directory structure.  E.g.,
#
#   https://example.org/myplugin.hpi
#
define bsl_jenkins::plugin(
  $version         = undef,
  $manage_config   = false,
  $config_filename = undef,
  $config_content  = undef,
  $update_url      = undef,
  $enabled         = true,
  $source          = undef,
  $digest_string   = undef,
  $digest_type     = 'sha1',
  $plugin_dir      = undef,
  $username        = undef,
  $group           = undef,
  $create_user     = undef,
) {
  validate_string($version)
  validate_bool($manage_config)
  validate_string($config_filename)
  validate_string($config_content)
  validate_string($update_url)
  validate_bool($enabled)
  validate_string($source)
  validate_string($digest_string)
  validate_string($digest_type)

  ::jenkins::plugin { $name:
    version         => $version,
    manage_config   => $manage_config,
    config_filename => $config_filename,
    config_content  => $config_content,
    update_url      => $update_url,
    enabled         => $enabled,
    source          => $source,
    digest_string   => $digest_string,
    digest_type     => $digest_type,
    plugin_dir      => $plugin_dir,
    username        => $username,
    group           => $group,
    create_user     => $create_user,
  }
}
