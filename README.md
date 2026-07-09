# rego-opa-labs

Hands-on lab repository for two courses:

1. **REGO Zero to Hero: Master the OPA Policy Language** — labs 01–08
2. **Rego & OPA in Practice: Production Policy as Code** — labs 09–16

All examples use **modern OPA v1 syntax**, version-pinned and updated quarterly.

## Quick start

```bash
# Install OPA (https://openpolicyagent.org/docs#running-opa)
brew install opa            # macOS
# Install Regal (linter)
brew install styrainc/packages/regal

make test    # run all policy unit tests
make lint    # run Regal
make fmt     # format all .rego files
```

## Repository layout

| Path | Purpose |
|---|---|
| `policies/` | Rego policies, grouped by domain |
| `tests/` | Unit tests (mirrors `policies/`) |
| `data/` | Sample inputs, datasets, fixtures |
| `labs/lab01…lab16` | Guided labs, one per course section |
| `platform/` | kind, Gatekeeper, Envoy, Istio, Terraform lab environments |
| `bundles/` | Bundle build output and examples |
| `docs/course-map.md` | Which lab goes with which course section |

## Versions (pinned)

| Tool | Version |
|---|---|
| OPA | v1.x (see `.opa-version`) |
| Regal | latest |
| Gatekeeper | see `platform/gatekeeper` |
| Conftest | see lab12 |

## License

Course lab code is provided under the MIT License (see `LICENSE`).
Open Policy Agent is a CNCF project licensed under Apache-2.0; this repository
is independent training material and is not affiliated with or endorsed by the
OPA project, CNCF, or the Linux Foundation.

## Contact

- Course questions: use the course Q&A first
- Email: naidu@altusx1.com
- GitHub: https://github.com/AltusX1 · Docker Hub: https://app.docker.com/accounts/altusx1
