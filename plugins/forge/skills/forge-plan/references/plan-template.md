# Plan template

Use this template for `docs/plans/<slug>.md`.

```md
# Plan: <title>

Created: YYYY-MM-DD
Status: draft | active | done | superseded

Spec: `docs/specs/<slug>.md`

## Strategy

<One short paragraph explaining the implementation order.>

## Slices

### 1. <slice title>

Status: pending | in-progress | done | blocked

Outcome:
- ...

Acceptance criteria covered:
- ...

Likely files or modules:
- ...

Test strategy:
- Portfolio fit:
- Layer:
- Seam:
- Regression needed:
- Contract/property/specialized test needed:
- Testcontainers or real dependency needed:
- CI tier:

Validation:
- ...

Dependencies:
- ...

Risks:
- ...

Stop conditions:
- ...

### 2. <slice title>

Status: pending | in-progress | done | blocked

Outcome:
- ...

Acceptance criteria covered:
- ...

Likely files or modules:
- ...

Test strategy:
- Portfolio fit:
- Layer:
- Seam:
- Regression needed:
- Contract/property/specialized test needed:
- Testcontainers or real dependency needed:
- CI tier:

Validation:
- ...

Dependencies:
- ...

Risks:
- ...

Stop conditions:
- ...

## Plan-level risks

- ...

## Checkpoints

- Before changing public API:
- Before touching data migrations:
- Before declaring done:

## Links

- Status: `docs/status.md`
- ADR: `docs/adr/...`
```
