# Lab 06 domain: Kubernetes. WORKED EXAMPLE. Use this as your template for the
# api.rego and terraform.rego policies. Input is a manifest.
package domains.kubernetes

import data.lib.labels

required := {"owner", "app"}

# deny for each required label missing from the manifest
deny contains msg if {
	some key in labels.missing(input.metadata.labels, required)
	msg := sprintf("manifest missing label: %s", [key])
}
