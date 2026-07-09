# Lab 01 — Rego Basics

**Course 1, Sections 2–3** · Est. time: 45 min

## Goal

Evaluate your first policies with the OPA CLI and the Rego Playground, and
understand the input → policy → decision flow.

## Prerequisites

- OPA CLI installed (`opa version` works)
- This repository cloned

## Exercises

### 1. Evaluate the example policy

```bash
opa eval -d policies/basics/ -i data/fixtures/input.json "data.basics.example.allow"
```

Expected: `true` (the fixture user is a developer performing `read`).

### 2. Flip the decision

Edit `data/fixtures/input.json` and change `"action": "read"` to `"action": "write"`.
Re-run the eval. Expected: `false`. Explain why in one sentence.

### 3. Add a rule

Add a rule to `policies/basics/example.rego`: **auditors can read anything**.
Then run the tests:

```bash
make test
```

Write a new test in `tests/basics/example_test.rego` proving auditors cannot write.

### 4. Playground round-trip

Paste your policy into the [Rego Playground](https://play.openpolicyagent.org/),
evaluate with the same input, and confirm the same decision.

## Success criteria

- [ ] All `make test` tests pass, including your new auditor tests
- [ ] You can explain the difference between `input` and `data`
- [ ] You can explain why an unmatched rule yields **undefined**, not an error
