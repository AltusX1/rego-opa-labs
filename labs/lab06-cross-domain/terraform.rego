# Lab 06 domain: Terraform (starter). Input is a plan with a list of resources.
package domains.terraform

import data.lib.labels

required := {"owner", "environment"}

# TODO: format msg as: "resource <name> missing tag: <key>"
deny contains msg if {
	some res in input.resources
	some key in labels.missing(res.tags, required)
	msg := key
}
