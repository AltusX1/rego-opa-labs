# Lab 03 tests. DO NOT EDIT. They pass before and after your refactor, proving
# the cleaner policy decides exactly the same things.
# Run:  opa test labs/lab03-reusable-design/ -v
package deploy_test

import data.deploy

test_admin_allowed if {
	deploy.allow with input as {"user": {"role": "admin"}, "action": "delete", "image": "anything"}
}

test_dev_deploy_trusted if {
	deploy.allow with input as {"user": {"role": "developer"}, "action": "deploy", "image": "registry.altusx1.com/app:1.0"}
}

test_dev_rollback_trusted if {
	deploy.allow with input as {"user": {"role": "developer"}, "action": "rollback", "image": "registry.altusx1.com/app:1.0"}
}

test_dev_deploy_untrusted_denied if {
	not deploy.allow with input as {"user": {"role": "developer"}, "action": "deploy", "image": "docker.io/app:1.0"}
}

test_dev_view_denied if {
	not deploy.allow with input as {"user": {"role": "developer"}, "action": "view", "image": "registry.altusx1.com/app:1.0"}
}

test_guest_denied if {
	not deploy.allow with input as {"user": {"role": "guest"}, "action": "deploy", "image": "registry.altusx1.com/app:1.0"}
}
