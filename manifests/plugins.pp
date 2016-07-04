class bsl_jenkins::plugins(
  $defaults = {},
) {
  $plugin_hash = hiera('bsl_jenkins::plugins', {})
  validate_hash($plugin_hash)

  create_resources(::jenkins::plugin, $plugin_hash, $defaults)
}
