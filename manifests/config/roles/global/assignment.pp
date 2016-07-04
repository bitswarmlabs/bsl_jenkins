define bsl_jenkins::config::roles::global::assignment(
  $role,
) {
  include bsl_jenkins::config

  notify { "global-role-assign-$name-to-$role":
    message => "## adding $name to $role",
  }

  augeas { "config-authorizationStrategy-globalRoles-assign-$name-to-$role":
    incl    => '/app/jenkins/config.xml',
    lens    => 'Xml.lns',
    changes => [
      "defnode ${role}Assignments hudson/authorizationStrategy/roleMap[#attribute/type='globalRoles']/role[#attribute/name='$role'] ''",
      "set \$${role}Assignments/assignedSIDs/sid[last()+1]/#text $name",
    ],
    notify => Exec['jenkins-config-tidy'],
  }
}
