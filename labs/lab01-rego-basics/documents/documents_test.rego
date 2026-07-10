# Lab: document-management authorization — TEST SUITE (12 tests)
#
# Run just this lab:
#   opa test labs/lab01-rego-basics/documents/ -v
#
# Against the STARTER, the six "should be allowed" tests fail. Your task is
# to make all twelve green with real logic (see README success criteria).
package authz.documents_test

import data.authz.documents

# 1. Admin may read a private document.
test_admin_reads_private if {
	documents.allow with input as {
		"user": {"name": "sam", "teams": ["admins"], "authenticated": true},
		"action": "read",
		"document": {"id": "d1", "owner": "alice", "visibility": "private", "flags": []},
	}
}

# 2. Admin may delete a normal (non-legal-hold) document.
test_admin_deletes_normal if {
	documents.allow with input as {
		"user": {"name": "sam", "teams": ["admins"], "authenticated": true},
		"action": "delete",
		"document": {"id": "d1", "owner": "alice", "visibility": "private", "flags": []},
	}
}

# 3. Admin may NOT delete a legal-hold document (clause 5 beats clause 1).
test_admin_cannot_delete_legal_hold if {
	not documents.allow with input as {
		"user": {"name": "sam", "teams": ["admins"], "authenticated": true},
		"action": "delete",
		"document": {"id": "d1", "owner": "alice", "visibility": "private", "flags": ["legal-hold"]},
	}
}

# 4. Any authenticated user may read a public document.
test_authenticated_reads_public if {
	documents.allow with input as {
		"user": {"name": "bob", "teams": [], "authenticated": true},
		"action": "read",
		"document": {"id": "d2", "owner": "alice", "visibility": "public", "flags": []},
	}
}

# 5. An UNauthenticated user may not read, even a public document.
test_unauthenticated_denied if {
	not documents.allow with input as {
		"user": {"name": "bob", "teams": [], "authenticated": false},
		"action": "read",
		"document": {"id": "d2", "owner": "alice", "visibility": "public", "flags": []},
	}
}

# 6. A plain user may not read someone else's private document.
test_user_cannot_read_others_private if {
	not documents.allow with input as {
		"user": {"name": "bob", "teams": [], "authenticated": true},
		"action": "read",
		"document": {"id": "d3", "owner": "alice", "visibility": "private", "flags": []},
	}
}

# 7. An owner may update their own document.
test_owner_updates_own if {
	documents.allow with input as {
		"user": {"name": "alice", "teams": [], "authenticated": true},
		"action": "update",
		"document": {"id": "d3", "owner": "alice", "visibility": "private", "flags": []},
	}
}

# 8. An owner may delete their own (non-legal-hold) document.
test_owner_deletes_own if {
	documents.allow with input as {
		"user": {"name": "alice", "teams": [], "authenticated": true},
		"action": "delete",
		"document": {"id": "d3", "owner": "alice", "visibility": "private", "flags": []},
	}
}

# 9. Even the owner may NOT delete their own legal-hold document.
test_owner_cannot_delete_own_legal_hold if {
	not documents.allow with input as {
		"user": {"name": "alice", "teams": [], "authenticated": true},
		"action": "delete",
		"document": {"id": "d3", "owner": "alice", "visibility": "private", "flags": ["legal-hold"]},
	}
}

# 10. An auditor may read any document, including a private one they don't own.
test_auditor_reads_any_private if {
	documents.allow with input as {
		"user": {"name": "eve", "teams": ["auditors"], "authenticated": true},
		"action": "read",
		"document": {"id": "d3", "owner": "alice", "visibility": "private", "flags": []},
	}
}

# 11. An auditor may NOT modify a document.
test_auditor_cannot_update if {
	not documents.allow with input as {
		"user": {"name": "eve", "teams": ["auditors"], "authenticated": true},
		"action": "update",
		"document": {"id": "d3", "owner": "alice", "visibility": "private", "flags": []},
	}
}

# 12. A non-owner, non-admin may not delete a document.
test_stranger_cannot_delete if {
	not documents.allow with input as {
		"user": {"name": "bob", "teams": [], "authenticated": true},
		"action": "delete",
		"document": {"id": "d3", "owner": "alice", "visibility": "private", "flags": []},
	}
}
