# Assignment: payment-approval policy — YOUR TESTS
#
# Write at least 8 tests of your own. You MUST include a self-approval case
# in every tier (under $500, mid, and above $10k). One example is provided
# to show the input shape — keep it, then add the rest.
#
# Run:  opa test labs/lab01-rego-basics/payment-approval/ -v
package payments.approval_test

import data.payments.approval

# Example (auto-approval tier): an order under $500 with no approvers.
test_small_order_auto_approved if {
	approval.allow with input as {"order": {
		"amount": 200,
		"requester": "alice",
		"requester_manager": "mgr",
		"approvers": [],
	}}
}

# TODO: add >= 7 more, including self-approval blocked in EVERY tier.
