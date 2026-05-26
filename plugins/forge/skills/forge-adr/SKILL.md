---
name: forge-adr
description: Create or update an Architecture Decision Record for a durable technical decision. Use when the user asks to record a decision, alternatives matter, reversal is costly, or future agents may otherwise undo or misunderstand the architecture.
---

# forge-adr

Record durable technical decisions. Do not use ADRs as specs, plans, notes, or TODO lists.

## Use when

- The user asks to record a technical or architectural decision.
- A durable decision has meaningful alternatives, consequences, or costly reversal.
- Future agents may otherwise misunderstand, undo, or repeatedly relitigate the decision.
- The user says "Record this decision", "Create an ADR", "Document the tradeoff", or "Save the architecture decision".

## Procedure

1. Check whether an ADR is warranted with `references/adr-criteria.md`.
2. Read existing ADRs, active spec/plan, `docs/status.md`, relevant code/config, and local skills.
3. Define the decision, context, alternatives, consequences, and revisit triggers.
4. If the issue is product behavior or an unspecified edge case, route to `forge-spec` instead of hiding it in an ADR.
5. Create or update `docs/adr/<number>-<slug>.md` with `references/adr-template.md`; create `docs/adr/` only as part of writing the ADR file.
6. Link related specs/plans/status when the decision affects current work.

## Output

```md
ADR:
- `docs/adr/NNNN-slug.md` / skipped

Decision:
- ...

Alternatives:
- ...

Consequences:
- ...

Revisit when:
- ...
```

## Constraints

- Do not create ADRs for small style preferences or reversible details.
- Do not record secrets or environment-specific credentials.
- Do not create empty artifact directories in advance.
- Do not rewrite ADR history without supersession.
- Do not use ADRs to bypass missing specs or user decisions.
- Do not mark an unresolved decision as accepted.

## References

- `references/adr-criteria.md`
- `references/adr-template.md`
