# Lab 02 STARTER test file. One example is given. Build it into a real suite:
# the allow case, one deny per condition, and the missing-input case.
#
# Run:  opa test labs/lab02-policy-testing/ -v
package authz_test

import data.authz

# Example: the happy path.
test_admin_allowed if {
	authz.allow with input as {"user": {"role": "admin"}, "action": "delete"}
}

# TODO: developer can read.
# TODO: developer canNOT write/delete  (use `not authz.allow ...`).
# TODO: owner can update their own resource.
# TODO: a non-owner canNOT update someone else's resource.
# TODO: a guest role is denied.
# TODO: missing input ({}) is denied.
