# Lab 05 tests. These pass before AND after you clean the policy. DO NOT EDIT.
# They exist so you can prove your cleanup didn't change behavior.
#
# Run:  opa test labs/lab05-regal-linting/ -v
package deploy_test

import data.deploy

test_allowed if {
	deploy.allow with input as {"replicas": 3, "metadata": {"labels": {"owner": "alice"}}}
}

test_denied_few_replicas if {
	not deploy.allow with input as {"replicas": 1, "metadata": {"labels": {"owner": "alice"}}}
}

test_denied_no_owner if {
	not deploy.allow with input as {"replicas": 3, "metadata": {"labels": {}}}
}

test_privileged_flag if {
	deploy.uses_privileged with input as {"flags": ["privileged"]}
}
