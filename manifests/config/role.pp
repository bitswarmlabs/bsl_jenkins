define bsl_jenkins::config::role(
  $users,
) {
  include stdlib

  validate_array($users)
  validate_string($name)

  if !empty($users) {
    bsl_jenkins::config::roles::global::assignment { $users:
      role    => $name,
      require => Class["bsl_jenkins::config::roles::global::$name"],
    }
  }
}
