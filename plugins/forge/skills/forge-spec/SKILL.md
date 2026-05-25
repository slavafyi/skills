---
name: forge-spec
description: Define the requirements for a clear feature, refactor, workflow, or significant change before planning or implementation. Use when the user asks for a spec, requirements, acceptance criteria, or when implementation would require guessing what should happen.
---

# forge-spec

Define what should change, why it should change, and how success will be judged. Do not plan implementation or write code.

## Use when

- The user asks for a spec, requirements, scope, non-goals, or acceptance criteria.
- A feature, refactor, workflow, or significant change is clear enough to define but not ready to plan or build.
- Implementation would require guessing product behavior, edge cases, or design intent.
- The user says "Write a spec", "Define requirements", "Clarify the behavior", or "What should happen when...?".

## Procedure

1. Read relevant context: `docs/status.md`, idea notes, existing specs, ADRs, project-local skills, and only enough code to understand current behavior.
2. Identify the requested change, scope, non-goals, constraints, and source of truth.
3. Resolve missing requirements with `references/spec-checklist.md`. Ask the user when an answer would change behavior, scope, or acceptance criteria.
4. Treat edge cases as design input. If an edge case changes expected behavior, record it as a requirement or open question; do not leave it for `forge-build` to guess.
5. Create or update `docs/specs/<slug>.md` with `references/spec-template.md`.
6. Route to `forge-plan` only when the spec is ready and implementation needs slicing.

## Output

```md
Spec:
- `docs/specs/<slug>.md`

Scope:
- ...

Acceptance criteria:
- ...

Open questions:
- ...

Next action:
- `forge-plan` / user decision / stop
```

## Constraints

- Do not implement code.
- Do not create an implementation plan; use `forge-plan` for that.
- Do not hide assumptions as requirements.
- Do not resolve product/design ambiguity by inventing an edge-case behavior.
- Do not create ADRs for ordinary requirements; route durable architecture choices to `forge-adr`.

## References

- `references/spec-checklist.md`
- `references/spec-template.md`
