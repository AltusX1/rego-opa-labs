# Lab 04 - Fix the broken policy pack

**Course 1, Section 6 · Lecture 6.7 · Est. time: 30 min**

`access.rego` has four planted bugs. The test suite in `access_test.rego` is
correct. Fix the policy until every test passes. **Do not edit the tests.**

## Intended behavior

- admins may do anything
- developers may read
- owners may read or update their own resource
- members of a privileged team may delete
- everyone else is denied

## How to work it

Run the suite, read the first failure, decide which failure mode it is
(Lecture 6.6), then `print` or trace to confirm before you fix:

```bash
opa test labs/lab04-broken-policies/ -v
```

Four bugs are hiding, one each of: a mistyped field (silent undefined), a wrong
comparison operator, a missing `default`, and a membership-vs-equality mistake
in a `some` loop.

## Success criteria

- [ ] All 7 tests pass.
- [ ] `make lint` is clean.
- [ ] You can name the failure mode you fixed on each line you changed.
