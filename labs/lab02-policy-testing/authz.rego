# Lab 02 policy (already working). Your job is the TESTS, not this file.
# A small RBAC gate: admins do anything, developers read, owners read/update
# their own resources. Modern OPA v1 syntax.
package authz

default allow := false

# Admins can do anything.
allow if input.user.role == "admin"

# Developers can read.
allow if {
	input.user.role == "developer"
	input.action == "read"
}

# Owners can read or update their own resource.
allow if {
	input.action in {"read", "update"}
	input.resource.owner == input.user.name
}
