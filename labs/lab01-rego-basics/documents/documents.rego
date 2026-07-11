# Lab: document-management authorization - STARTER
#
# Translate the memo in README.md into Rego. The decision is a single
# boolean `allow`. Modern OPA v1 syntax (no `import rego.v1` on OPA >= 1.0).
#
# The instructor has wired the top-level shape for you: `allow` is granted
# when SOME memo clause permits the action AND no override denies it.
# Your job is the middle - fill in `permitted` (clauses 1-4) and `denied`
# (clause 5). Replace the `if false` stubs with real logic.
package authz.documents

# Deny by default.
default allow := false

# Given wiring - do not change this rule.
allow if {
	permitted
	not denied
}

# --------------------------------------------------------------------------
# TODO(1): Administrators may perform any action.
# TODO(2): Any authenticated user may read a public document.
# TODO(3): A document's owner may read, update, or delete their own document.
# TODO(4): Users on the "auditors" team may read any document (read only).
#
# Write one `permitted if { ... }` rule per clause. Remember: separate rules
# with the same name are OR - any one firing is enough.
# --------------------------------------------------------------------------
permitted if false # replace me

# --------------------------------------------------------------------------
# TODO(5): Nobody may delete a document flagged "legal-hold" - not even an
# admin. This is an override: a deny that beats every allow. Because the
# given `allow` rule requires `not denied`, defining this correctly is all
# you need for the override to win.
# --------------------------------------------------------------------------
denied if false # replace me
