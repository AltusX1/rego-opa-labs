# Lab 06 SHARED LIBRARY (starter). One helper, used by all three domains.
package lib.labels

# TODO: return the SET of keys in `required` that are NOT present in `present`.
# It's a set comprehension (Section 4). Right now it returns the empty set,
# so every domain's deny rule stays empty. Implement it and all three light up.
missing(present, required) := set()
