# Lab 02 - Policy testing

**Course 1, Section 6 · Lecture 6.7 · Est. time: 25 min**

The policy in `authz.rego` already works. Your job is to write its test suite.

## The policy

A small RBAC gate: admins do anything, developers read, owners read or update
their own resource.

## Your task (in `authz_test.rego`)

Turn the one example test into a real suite. Cover all three cases from
Lecture 6.3:

1. **Allow**: the happy path (given: admin).
2. **Deny**, one per condition: developer cannot write, a non-owner cannot
   update someone else's resource, a guest is denied.
3. **Missing input**: empty input `{}` is denied.

Use `authz.allow with input as {...}` to assert allow, and
`not authz.allow with input as {...}` to assert deny.

## Run

```bash
opa test labs/lab02-policy-testing/ -v
```

## Success criteria

- [ ] Tests cover allow, every deny condition, and the missing-input case.
- [ ] `make lint` is clean.
- [ ] `opa test --coverage labs/lab02-policy-testing/` shows every `allow` rule exercised.
