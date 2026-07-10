# Lab 01 · Part B - Translate a business policy into tested Rego

**Course 1, Section 3 (Rego Fundamentals) · Lecture 3.7 · Est. time: 20–30 min**

The most realistic exercise so far: you get a policy memo written in plain
English, the way policy actually arrives at your desk, and turn it into
tested Rego.

## The memo (from the compliance team, document-management API)

1. **Administrators** may perform any action.
2. Any **authenticated** user may **read public** documents.
3. A document's **owner** may **read, update, or delete** their own documents.
4. Users on the **`auditors`** team may **read any** document, but never modify anything.
5. **Nobody** may **delete** documents flagged **`legal-hold`**, not even admins.

Clause 5 is different in kind: it's an *override*, a deny that beats every
allow.

## Input shape

```json
{
  "user":     { "name": "alice", "teams": ["auditors"], "authenticated": true },
  "action":   "read",
  "document": { "id": "d3", "owner": "alice", "visibility": "private", "flags": ["legal-hold"] }
}
```

- `action` is one of `read`, `update`, `delete`.
- `document.visibility` is `public` or `private`.
- `document.flags` is an array that may contain `legal-hold`.
- Admins and auditors are modelled as membership in `user.teams`
 (`"admins"` / `"auditors"`).

## Your task

Produce a policy in package `authz.documents` with a single boolean `allow`.
The starter file (`documents.rego`) already wires the shape for you:

```rego
allow if {
    permitted            # some memo clause 1–4 grants it
    not denied           # ...and no override (clause 5) blocks it
}
```

Your job is the middle: encode clauses 1–4 as `permitted` rules (one per
clause), and clause 5 as `denied`. Replace the two `if false` stubs.

## Run the tests

```bash
opa test labs/lab01-rego-basics/documents/ -v
```

There are **12 tests**. Against the starter, the six "should be allowed"
cases fail (everything is denied) and the six "should be denied" cases pass
trivially, so **don't trust green until your `permitted` rules exist.**
Work clause by clause and watch the allow-cases flip green.

## Success criteria

- [ ] All 12 tests pass (`opa test labs/lab01-rego-basics/documents/`).
- [ ] `make lint` is clean for these files.
- [ ] You can point at the line where "deny overrides allow" happens and
 explain why `not denied` is safe there, using the undefined-vs-false
 vocabulary from Lecture 3.4.

## Stretch goal

Add a rate-limit clause: reject any action when
`input.user.requests_this_minute` exceeds 100. You'll want a comparison
operator from Lecture 3.6.

## Explore with fixtures

Sample inputs are in [`fixtures/`](fixtures/), run `opa eval` against any scenario (see that folder's README for the expected decisions).
