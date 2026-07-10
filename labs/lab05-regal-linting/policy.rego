# Lab 05 MESSY policy. It works and its tests pass, but it's written badly.
# Your job: make `regal lint` happy without breaking a single test.
# Anti-patterns hiding here: redundant future imports, a bare `=`, comparisons
# to `true`, and old-style membership. Start with `opa fmt --write`.
package deploy

import future.keywords.if
import future.keywords.in

default allow = false

# a deployment is allowed with enough replicas and an owner label
allow if {
	enough_replicas == true
	has_owner == true
}

enough_replicas if {
	input.replicas >= 2
}

has_owner if {
	input.metadata.labels.owner != ""
}

# is the deployment asking for a privileged flag?
uses_privileged if {
	input.flags[_] == "privileged"
}
