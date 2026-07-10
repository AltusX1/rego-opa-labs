# Lab 04 BROKEN policy pack. Four bugs are planted below.
# Do NOT edit the tests. Fix THIS file until `opa test` is all green.
# Bugs map to the failure modes from Section 6: silent undefined, wrong
# operator, missing default, and a membership-vs-equality miss.
package access

# Intended behavior:
#   - admins may do anything
#   - developers may read
#   - owners may read or update their own resource
#   - members of a privileged team may delete
#   - everyone else is denied

allow if is_admin

allow if {
	input.user.role == "developer"
	input.action != "read"
}

allow if {
	input.action in {"read", "update"}
	input.resource.owner == input.user.name
}

allow if {
	some team in input.user.teams
	team == privileged_teams
	input.action == "delete"
}

is_admin if input.user.rol == "admin"

privileged_teams := {"platform", "security"}
