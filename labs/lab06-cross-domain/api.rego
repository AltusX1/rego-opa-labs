# Lab 06 domain: API authorization (starter). Input is a request with metadata.
package domains.api

import data.lib.labels

required := {"owner", "team"}

# TODO: format msg as: "request metadata missing required key: <key>"
# (right now it just uses the raw key; make it match the kubernetes.rego style)
deny contains msg if {
	some key in labels.missing(input.request.metadata, required)
	msg := key
}
