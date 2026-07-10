# Lab 05 - Style, linting & modern Rego

**Course 1, Section 7 · Lecture 7.5 · Est. time: 25 min**

`policy.rego` works and its tests pass, but it's written badly. Make `regal lint`
report zero findings without breaking a single test. **Do not edit the tests.**

## What's wrong in there

- redundant `import future.keywords` lines (fossils in v1)
- a bare `=` where `:=` belongs
- comparisons to `true` (`x == true`)
- old-style membership (`arr[_] == "x"` instead of `"x" in arr`)

## The loop

```bash
opa fmt --write labs/lab05-regal-linting/policy.rego   # clears the mechanical stuff
regal lint labs/lab05-regal-linting/                   # read the top finding, fix it
opa test labs/lab05-regal-linting/ -v                  # prove behavior held
```

Repeat until `regal lint` is clean and the tests are still green.

## Success criteria

- [ ] `regal lint` reports zero findings.
- [ ] `opa test labs/lab05-regal-linting/` still passes all four tests.
- [ ] You can put the before and after side by side and explain why the after is more modern.

Note: exact findings depend on your installed Regal version. The clean reference is the target shape.
