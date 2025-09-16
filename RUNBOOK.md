
## ARCH’s Duties (Orchestrator Role)

ARCH (the architect/orchestrator capsule) is responsible for:

- **Tracking reseeds**:
  - Monitors seed versions (seedv=1.0 → 1.1).
  - Detects capsule drift or protocol breaks.
  - Issues reseed instructions (`./scripts/reseed.sh <CAP>`).
  - You (the human) never need to remember — ARCH reminds you.

- **Maintaining 44-pack protocol**:
  - Ensures each capsule outputs 44 batched commands.
  - Confirms Vancouver PT timestamp and % completion when logged.

- **Ops alignment**:
  - Works with MOM to verify repo health (`verify.sh`, `PROOF.md`).
  - Updates RUNBOOK.md when new flows or features are locked in.

- **Scaling guardrail**:
  - Decides when to move from manual reseed (CLI) → automated reseed (GitHub Actions).
  - Always prioritizes speed + safety.

⚡ In short: ARCH carries the memory, you only copy–paste commands or run reseed.sh when told.
