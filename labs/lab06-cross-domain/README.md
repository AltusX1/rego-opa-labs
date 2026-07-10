# Lab 06 - Rego across domains (mini-project)

**Course 1, Section 8 · Lecture 8.7 · Est. time: 30 min**

Prove portability to yourself. Build ONE shared helper and use it, unchanged,
across three domains: API authorization, Kubernetes, and Terraform.

## The pieces

- `lib.rego`: the shared helper `lib.labels.missing(present, required)` (starter).
- `kubernetes.rego`: the WORKED EXAMPLE. Study it, then copy the pattern.
- `api.rego`, `terraform.rego`: starters for you to finish.
- `crossdomain_test.rego`: the test suite (do not edit).

## Your tasks

1. Implement `missing` in `lib.rego`: the set of required keys not present (a
   Section 4 set comprehension). This lights up all three domains.
2. Fix the `deny` message in `api.rego` to match:
   `request metadata missing required key: <key>`
3. Fix the `deny` message in `terraform.rego` to match:
   `resource <name> missing tag: <key>`

`kubernetes.rego` is already done. Use it as your template.

## Run

```bash
opa test labs/lab06-cross-domain/ -v
```

Eight tests. Against the starter, four fail. Finish the three tasks and all eight go green.

## Success criteria

- [ ] All 8 tests pass.
- [ ] `make lint` is clean.
- [ ] You can point at the single `missing` function and say: that one function enforces policy in three different systems.
