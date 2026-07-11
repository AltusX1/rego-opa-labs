# Lab 08 - Capstone: a reusable policy library

**Course 1, Section 10 · Est. time: 2-4 hours**

Build a small, real policy library for Nimbus, a fictional platform where teams
deploy services. This is your portfolio piece: a public repo you can show an
employer.

## Suggested layout

```
policies/
  nimbus/authz/       # M1
  nimbus/validation/  # M2
  lib/                # shared helpers
tests/                # mirrors policies one-to-one
data/                 # stable lookup tables
Makefile              # test + lint targets
.github/workflows/    # CI: run make test + make lint
```

## Milestone 1: Authorization (`nimbus.authz`, boolean `allow`)

- admins may perform any action
- a service's owning team may deploy, update, or delete it
- any authenticated user may view any service
- a `frozen` service cannot be mutated (deploy/update/delete) by anyone, not even
  an admin (an override)

Input carries `user` (name, team, roles, authenticated), `action`, and `service`
(name, owner_team, flags). Test: allow, a deny per rule, the frozen override, and
missing input.

## Milestone 2: Validation (`nimbus.validation`, `deny` set)

Each violation is `{code, msg, resource}`:

- every service must carry `owner` and `team` labels
- no container may use the `:latest` tag
- every container must declare a memory limit

Add `valid if count(deny) == 0`. Test a clean service (zero violations) and a bad
one (assert on the codes).

## Milestone 3: Make it a library

- `regal lint` reports zero findings
- a short README per package
- a CI workflow running `make test` and `make lint` on every pull request

## Rubric (grade yourself)

Correctness, coverage (denies + missing input), cleanliness (Regal zero),
structure (packages + lib + mirrored tests), documentation, CI.

The reference solution drops as a video walkthrough. Genuinely build yours first.
