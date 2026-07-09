# Example policy — Course 1, Section 2 "Your first policy"
# Modern OPA v1 syntax (no `import rego.v1` needed on OPA >= 1.0).
package basics.example

# Deny by default: if no allow rule matches, the decision is false.
default allow := false

# Admins can do anything.
allow if input.user.role == "admin"

# Developers can read.
allow if {
	input.user.role == "developer"
	input.action == "read"
}
