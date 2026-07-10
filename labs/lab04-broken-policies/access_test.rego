# Lab 04 test suite. DO NOT EDIT. These assert the intended behavior.
# Several fail against the broken policy. Fix access.rego until all pass.
#
# Run:  opa test labs/lab04-broken-policies/ -v
package access_test

import data.access

# admin may do anything (breaks on the mistyped field bug)
test_admin_allowed if {
	access.allow with input as {"user": {"role": "admin"}, "action": "delete"}
}

# a guest is explicitly false, not undefined (breaks on the missing-default bug)
test_guest_is_false if {
	access.allow == false with input as {"user": {"role": "guest"}, "action": "read"}
}

# developer may read (breaks on the wrong-operator bug)
test_developer_can_read if {
	access.allow with input as {"user": {"role": "developer"}, "action": "read"}
}

# developer may NOT delete (breaks on the wrong-operator bug)
test_developer_cannot_delete if {
	not access.allow with input as {"user": {"role": "developer"}, "action": "delete"}
}

# owner may update their own resource (correct rule, should already pass)
test_owner_can_update_own if {
	access.allow with input as {
		"user": {"name": "alice", "role": "developer"},
		"action": "update",
		"resource": {"owner": "alice"},
	}
}

# a privileged-team member may delete (breaks on the membership-vs-equality bug)
test_privileged_team_can_delete if {
	access.allow with input as {
		"user": {"name": "sam", "role": "developer", "teams": ["platform"]},
		"action": "delete",
	}
}

# someone not on a privileged team may NOT delete (should already pass)
test_non_privileged_cannot_delete if {
	not access.allow with input as {
		"user": {"name": "bob", "role": "developer", "teams": ["app"]},
		"action": "delete",
	}
}
