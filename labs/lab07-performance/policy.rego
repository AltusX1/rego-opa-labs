# Lab 07 SLOW policy (starter). It works and its tests pass, but it iterates the
# whole ACL on every query. The data is already keyed by user, so this scan is
# doing work the map would give you for free. Speed it up (see README).
package perf

default allow := false

# Slow on purpose: a linear scan to find the matching user.
allow if {
	some user, actions in data.acl
	user == input.user
	input.action in actions
}
