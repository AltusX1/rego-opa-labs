# Document-authz fixtures

Sample inputs for exploring the policy by hand. Once your `documents.rego` is
complete, evaluate any scenario against it:

```bash
opa eval -d labs/lab01-rego-basics/documents/documents.rego \
  -i labs/lab01-rego-basics/documents/fixtures/admin_reads_private.json \
  "data.authz.documents.allow"
```

Swap in any file below. Expected `allow` decision for the reference solution:

| Fixture | Scenario | Expected `allow` |
|---------|----------|------------------|
| `admin_reads_private.json` | admin reads a private doc | `true` |
| `admin_deletes_legalhold.json` | admin deletes a legal-hold doc | `false` (clause 5 override) |
| `owner_updates_own.json` | owner updates their own doc | `true` |
| `auditor_reads_private.json` | auditor reads someone's private doc | `true` |
| `stranger_deletes.json` | non-owner, non-admin deletes | `false` |

Against the **starter** skeleton every case returns `false`. That's the point.
