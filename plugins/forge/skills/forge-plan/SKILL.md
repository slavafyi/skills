---
name: forge-plan
description: Turn a ready spec into a small, ordered implementation plan. Use when a spec has clear requirements but the work needs slicing, sequencing, validation strategy, or risk reduction before build.
---

# forge-plan

Slice a ready spec into verifiable implementation steps. Do not define new requirements or write code.

## Use when

- A spec is ready and needs implementation slicing, sequencing, or risk reduction.
- The work needs validation strategy, dependencies, stop conditions, or an ordered first slice.
- The user asks for an implementation plan without asking to write code yet.
- The user says "Make a plan", "Break this down", "Create an implementation plan", "What's the first slice?", or asks to plan from an issue/PR.

## Procedure

1. Read the active spec, `docs/status.md`, relevant ADRs, project-local skills, and current Git status.
2. If the prompt includes an issue or PR reference, fetch it as context first; ask for a URL, setup, or pasted context when resolution or provider access is blocked.
3. Check that the spec is ready using `references/planning-checklist.md`. Route back to `forge-spec` when requirements, non-goals, or edge cases are missing.
4. Identify design risks, dependencies, and validation signals before choosing implementation order.
5. Create or update `docs/plans/<slug>.md` with `references/plan-template.md`; create `docs/plans/` only as part of writing the plan file.
6. Split work into vertical slices where each slice has an outcome, acceptance criteria, likely files, validation, dependencies, and stop conditions.
7. Update `docs/status.md` only when the active continuation point changes.

## Output

```md
Plan:
- `docs/plans/<slug>.md`

Strategy:
- ...

First slice:
- ...

Risks / stop conditions:
- ...

Next action:
- `forge-build` / user decision / stop
```

## Constraints

- Do not implement code.
- Do not change requirements silently; route back to `forge-spec`.
- Do not create empty artifact directories in advance.
- Do not plan around symptoms, unclear failures, or unspecified edge cases.
- Do not create a broad horizontal plan where validation happens only at the end.
- Do not ignore current uncommitted work.

## References

- `references/planning-checklist.md`
- `references/plan-template.md`
