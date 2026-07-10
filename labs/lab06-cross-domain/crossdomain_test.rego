# Lab 06 test suite. DO NOT EDIT. Proves the shared helper works and that each
# domain uses it correctly. Run:  opa test labs/lab06-cross-domain/ -v
package crossdomain_test

import data.domains.api
import data.domains.kubernetes
import data.domains.terraform
import data.lib.labels

# --- the shared helper ---
test_missing_computes if {
	labels.missing({"owner": "a"}, {"owner", "team"}) == {"team"}
}

test_missing_none if {
	labels.missing({"owner": "a", "team": "x"}, {"owner", "team"}) == set()
}

# --- API domain ---
test_api_denies_missing_team if {
	"request metadata missing required key: team" in api.deny with input as {"request": {"metadata": {"owner": "alice"}}}
}

test_api_clean if {
	count(api.deny) == 0 with input as {"request": {"metadata": {"owner": "alice", "team": "platform"}}}
}

# --- Kubernetes domain ---
test_k8s_denies_missing_app if {
	"manifest missing label: app" in kubernetes.deny with input as {"metadata": {"labels": {"owner": "alice"}}}
}

test_k8s_clean if {
	count(kubernetes.deny) == 0 with input as {"metadata": {"labels": {"owner": "alice", "app": "web"}}}
}

# --- Terraform domain ---
test_tf_denies_missing_env if {
	"resource db missing tag: environment" in terraform.deny with input as {"resources": [{"name": "db", "tags": {"owner": "alice"}}]}
}

test_tf_clean if {
	count(terraform.deny) == 0 with input as {"resources": [{"name": "db", "tags": {"owner": "alice", "environment": "prod"}}]}
}
