# Lab: collections & comprehensions - TEST SUITE (8 tests)
#
# Run:  opa test labs/lab01-rego-basics/collections/ -v
# Against the STARTER the four "shape" tests fail; make them green by
# writing the rules in collections.rego.
package collections_test

import data.collections

# 1. admins is exactly the list of admin users (only sam, in this dataset).
test_admins_lists_only_sam if {
	collections.admins == ["sam"]
}

# 2. an owner can read their own (private) resource.
test_owner_can_read if {
	collections.can_read({"id": "r1", "owner": "alice", "visibility": "private"}) with input as {"user": "alice"}
}

# 3. anyone can read a public resource.
test_public_readable_by_anyone if {
	collections.can_read({"id": "r2", "owner": "sam", "visibility": "public"}) with input as {"user": "bob"}
}

# 4. an admin can read a private resource they don't own.
test_admin_can_read_private if {
	collections.can_read({"id": "r1", "owner": "alice", "visibility": "private"}) with input as {"user": "sam"}
}

# 5. a stranger cannot read someone else's private resource.
test_stranger_cannot_read_private if {
	not collections.can_read({"id": "r1", "owner": "alice", "visibility": "private"}) with input as {"user": "bob"}
}

# 6. missing_owners is exactly the set of ownerless resource ids.
test_missing_owners if {
	collections.missing_owners == {"r3"}
}

# 7. an owned resource is NOT in missing_owners.
test_owned_not_missing if {
	not "r1" in collections.missing_owners
}

# 8. team_sizes maps each team to its member count.
test_team_sizes if {
	collections.team_sizes == {"platform": 2, "security": 1, "app": 3}
}
