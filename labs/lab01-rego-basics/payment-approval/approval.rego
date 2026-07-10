# Assignment: payment-approval policy — STARTER
#
# This is a graded, solo assignment. There is NO skeleton this time: read the
# memo in README.md and build `allow` from scratch. Modern OPA v1 syntax.
#
# Deliverable: a single boolean `allow` decision in this package.
package payments.approval

# Deny by default. Everything else is up to you.
# TODO: replace with your policy — tiered thresholds + the self-approval rule.
default allow := false
