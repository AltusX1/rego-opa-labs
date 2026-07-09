package basics.example_test

import data.basics.example

test_admin_can_delete if {
	example.allow with input as {"user": {"role": "admin"}, "action": "delete"}
}

test_developer_can_read if {
	example.allow with input as {"user": {"role": "developer"}, "action": "read"}
}

test_developer_cannot_write if {
	not example.allow with input as {"user": {"role": "developer"}, "action": "write"}
}

test_unknown_role_denied if {
	not example.allow with input as {"user": {"role": "guest"}, "action": "read"}
}
