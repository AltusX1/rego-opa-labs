# Lab 03 MONOLITHIC policy (starter). It works and its tests pass, but it's
# repetitive: the admin check and the trusted-registry check each appear more
# than once. Refactor it into a helper and a function (see README). The tests
# must stay green the whole way.
package deploy

default allow := false

allow if {
	input.user.role == "admin"
}

allow if {
	input.user.role == "developer"
	input.action == "deploy"
	startswith(input.image, "registry.altusx1.com/")
}

allow if {
	input.user.role == "developer"
	input.action == "rollback"
	startswith(input.image, "registry.altusx1.com/")
}
