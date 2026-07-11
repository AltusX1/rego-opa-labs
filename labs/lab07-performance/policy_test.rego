# Lab 07 tests. DO NOT EDIT. They pass before and after your refactor, proving
# the faster policy decides exactly the same things.
# Run:  opa test labs/lab07-performance/ -v
package perf_test

import data.perf

test_alice_read if {
	perf.allow with input as {"user": "alice", "action": "read"}
}

test_alice_write if {
	perf.allow with input as {"user": "alice", "action": "write"}
}

test_alice_delete_denied if {
	not perf.allow with input as {"user": "alice", "action": "delete"}
}

test_bob_read if {
	perf.allow with input as {"user": "bob", "action": "read"}
}

test_bob_write_denied if {
	not perf.allow with input as {"user": "bob", "action": "write"}
}

test_unknown_user_denied if {
	not perf.allow with input as {"user": "carol", "action": "read"}
}
