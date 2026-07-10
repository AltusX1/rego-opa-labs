# Payment-approval fixtures

Sample orders for exploring your policy by hand. Once your `approval.rego` is
built, evaluate a scenario against it:

```bash
opa eval -d labs/lab01-rego-basics/payment-approval/approval.rego \
  -i labs/lab01-rego-basics/payment-approval/fixtures/small_auto.json \
  "data.payments.approval.allow"
```

Expected `allow` decision for a correct solution:

| Fixture | Scenario | Expected `allow` |
|---------|----------|------------------|
| `small_auto.json` | order under $500, no approvers | `true` |
| `mid_manager.json` | $5k order, requester's manager approves | `true` |
| `mid_self_approval.json` | $5k order, requester is one of the approvers | `false` |
| `large_both.json` | $50k order, manager + finance approve | `true` |

These four cover every tier plus the self-approval override. Your own test
suite should go further, self-approval blocked in *every* tier, missing
manager/finance, and the boundary amounts ($500 and $10,000).
