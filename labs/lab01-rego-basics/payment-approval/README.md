# Assignment · Payment-approval policy from structured JSON

**Course 1, Section 3 · Lecture 3.8 · Graded, solo · Est. time: 30 min**

Your first graded assignment — no starter skeleton. Translate the memo below
into a tested Rego policy.

## The memo (finance team)

- Purchase orders **under $500** are **auto-approved** — no approver required.
- Orders **from $500 up to $10,000** must list the **requester's manager** as
  an approver.
- Orders **above $10,000** must have **both the manager AND someone from
  finance** as approvers.
- **No one may approve their own request** — in any role. This applies in
  **every tier** and always wins.

## Input shape (document your exact assumptions in a README)

```json
{
  "order": {
    "amount": 5000,
    "requester": "alice",
    "requester_manager": "mgr",
    "approvers": [
      { "id": "mgr", "role": "manager" },
      { "id": "fin", "role": "finance" }
    ]
  }
}
```

- `amount` is a number (USD).
- `requester` / `requester_manager` are user-id strings.
- `approvers` is an array of `{ id, role }`; `role` is `manager` or `finance`.

## Deliverables

1. The policy in package `payments.approval`, producing a boolean `allow`.
2. **At least 8** `opa test` unit tests of your own — including the
   **self-approval edge case in every tier** (under $500, mid, above $10k).
3. A clean **Regal lint** (`make lint` with no findings).
4. A **3-line README** stating your input-shape assumptions. Policies are
   contracts; contracts document their inputs.

## Run

```bash
opa test labs/lab01-rego-basics/payment-approval/ -v
```

## Hints

- No skeleton is deliberate — struggling productively for 30 minutes teaches
  more than watching me type for three hours.
- Use the undefined-vs-false vocabulary from Lecture 3.4 to reason about the
  self-approval override.
- Use `some ... in` iteration (Lecture 3.5) to search the `approvers` list.

The reference solution drops as a video walkthrough at the start of
Section 4 — genuinely try it before watching.

## Explore with fixtures

Sample orders are in [`fixtures/`](fixtures/) — one per tier plus a self-approval case (see that folder's README).
