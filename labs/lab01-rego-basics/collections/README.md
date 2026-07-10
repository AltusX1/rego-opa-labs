# Lab 01 · Part D - Collections & comprehensions

**Course 1, Section 4 · Lecture 4.6 · Est. time: 25 min**

Write four rules over a small identity dataset, one tool from Section 4 per
rule.

## The dataset (`data.json`)

- `data.roles`, map of user → role (`alice: developer`, `sam: admin`, …)
- `data.teams`, map of team → list of members
- `data.resources`, list of `{id, owner, visibility}` (one has no owner)

## Your rules (in `collections.rego`)

1. **`admins`**, a filtering comprehension: the array of every user whose role
 is `admin`.
2. **`can_read(resource)`**, a function: true if `input.user` is an admin, is
 the resource's owner, or the resource is public.
3. **`missing_owners`**, a partial set: every resource id with no owner set
 (use a presence check, recall undefined-vs-false from Lecture 3.4).
4. **`team_sizes`**, an object comprehension: each team name mapped to its
 member count.

## Run the tests

```bash
opa test labs/lab01-rego-basics/collections/ -v
```

Eight tests. Against the starter, the four "shape" tests fail (empty stubs) and
the negative tests pass trivially, so get **all eight** green with real rules.

## Success criteria

- [ ] All 8 tests pass.
- [ ] `make lint` is clean for these files.
- [ ] For each rule, you can say out loud which shape it returns (array / set /
 object) and why that shape is the right one.

## Stretch

Add `readable_resources`, the set of resource ids `input.user` can read,
using `can_read` inside a set comprehension over `data.resources`.
