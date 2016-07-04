class bsl_jenkins::plugins(
  $plugins,
  $defaults = $bsl_jenkins::params::plugin_defaults,
) inherits bsl_jenkins::params {
  validate_hash($plugins)
  create_resources('bsl_jenkins::plugin', $plugins, $defaults)
}
