# Lab: collections & comprehensions over a user/role dataset — STARTER
#
# The dataset is in data.json: data.roles (user → role), data.teams
# (team → members), data.resources (list of {id, owner, visibility}).
# Write each rule below, one tool from Section 4 per rule. Modern OPA v1.
#
# Run:  opa test labs/lab01-rego-basics/collections/ -v
package collections

# TODO(1) — filtering comprehension:
#   the array of every username whose role is "admin".
admins := []

# TODO(2) — function:
#   can `input.user` read `resource`?  True if input.user is an admin,
#   is the resource's owner, or the resource is public.
can_read(resource) if false

# TODO(3) — partial set + presence check:
#   the set of every resource id that has no owner set.
missing_owners := set()

# TODO(4) — object comprehension:
#   a map from each team name to its number of members.
team_sizes := {}
