# Lab 07 - Performance

**Course 1, Section 9 · Lecture 9.5 · Est. time: 20 min**

`policy.rego` works and its tests pass, but it's slow on purpose: it iterates the
whole access-control list on every query. The data is already keyed by user, so
the scan does work the map would give you for free. Speed it up without changing
what it decides.

## The loop

```bash
# 1. baseline
opa bench -d labs/lab07-performance/policy.rego -d labs/lab07-performance/data.json \
  -i labs/lab07-performance/input.json "data.perf.allow"

# 2. refactor policy.rego to a direct lookup (see task below)

# 3. bench again and compare ns/op
```

Then confirm behavior is unchanged:

```bash
opa test labs/lab07-performance/ -v
```

## Your task

Replace the `some ... ==` scan in the `allow` rule with a direct keyed lookup:
`input.action in data.acl[input.user]`. The iteration should disappear entirely.

## Success criteria

- [ ] All 6 tests still pass.
- [ ] The `allow` rule contains no iteration over the ACL.
- [ ] Your second `opa bench` is measurably faster. Record both numbers in a comment.
