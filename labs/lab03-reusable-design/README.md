# Lab 03 - Reusable policy design

**Course 1, Section 5 · Lecture 5.6 · Est. time: 25 min**

`policy.rego` works and its tests pass, but it's monolithic and repetitive: the
admin check and the trusted-registry check each appear more than once. Refactor
it into reusable pieces without breaking a single test.

## Your moves

1. Extract the repeated admin check into a helper rule: `is_admin`.
2. Extract the repeated registry check into a function: `trusted(image)`.
3. Collapse the two near-identical developer rules into one, using a set of
   allowed actions (`input.action in {"deploy", "rollback"}`).

## Run

```bash
opa test labs/lab03-reusable-design/ -v
```

Tests stay green the whole way. Green before, green after, green at every step.

## Success criteria

- [ ] All 6 tests still pass.
- [ ] No condition is written more than once.
- [ ] `make lint` is clean.

## Stretch

Split the cross-cutting helpers (`is_admin`, `trusted`) into a `lib` package and
import them, the way you proved out in Section 8.
