# Lab 01 - Rego Basics (Sections 2–3)

> This lab has three parts:
> **A. Rego basics** (below) · **B. `documents/`**, translate a business policy (S3) · **C. `payment-approval/`**, graded assignment (S3).

## Part A - first policies

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

---

## Part B - Translate a business policy into tested Rego (S3, Lecture 3.7)

See [`documents/README.md`](documents/README.md). You get a 5-clause
compliance memo (with a legal-hold override) and a 12-test suite; encode the
policy in `authz.documents` until all tests are green.

```bash
opa test labs/lab01-rego-basics/documents/ -v
```

## Part C - Assignment: payment-approval policy (S3, Lecture 3.8, graded)

See [`payment-approval/README.md`](payment-approval/README.md). Solo, no
skeleton: build a tiered approval policy in `payments.approval` with your own
tests (≥8, self-approval in every tier).

```bash
opa test labs/lab01-rego-basics/payment-approval/ -v
```

## Part D - Collections & comprehensions (S4, Lecture 4.6)

See [`collections/README.md`](collections/README.md). Four rules over a
user/role dataset, a filtering comprehension, a function, a partial set, and an
object comprehension.

```bash
opa test labs/lab01-rego-basics/collections/ -v
```
