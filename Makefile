.PHONY: test lint fmt check eval

test:
	opa test policies/ tests/ data/ -v

lint:
	regal lint policies/ tests/

fmt:
	opa fmt --write policies/ tests/

check: fmt lint test

eval:
	opa eval -d policies/ -i data/fixtures/input.json "data.basics.example.allow"
