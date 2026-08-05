---
name: harden-adr
description: Create or update an Architecture Decision Record when the user asks to record a durable technical decision, or when a cross-cutting choice has real alternatives, costly reversal, and rationale not obvious from code. Do not use for ordinary requirements, local style, routine configuration, or reversible implementation details.
---

# harden-adr

Record only decisions whose rationale must survive future sessions.

## Procedure

1. If the user did not explicitly request an ADR, apply every required test in
   `references/adr-criteria.md` before creating one.
2. Read relevant code, configuration, tests, existing ADRs, and the user or
   issue context that owns the decision.
3. For implicit use, skip the ADR when the criteria fail and point to the
   existing source of truth. Honor an explicit request, but keep a local or
   reversible decision correspondingly short.
4. Capture the context, chosen direction, meaningful alternatives,
   consequences, application boundary, and revisit trigger.
5. Create or update `docs/adr/<number>-<slug>.md` using
   `references/adr-template.md`. Create the directory only with the first real
   ADR.
6. Mark the ADR `accepted` only when the user or established project process
   has selected the decision; otherwise use `proposed`.

## Constraints

- Do not use an ADR as a requirement document, task list, handoff note, or
  implementation log.
- Do not duplicate a rule already made clear and enforceable by code, tests, a
  linter, or configuration.
- Do not record secrets, credentials, or machine-specific values.
- Supersede accepted ADRs instead of rewriting their history.

## References

- `references/adr-criteria.md`
- `references/adr-template.md`
