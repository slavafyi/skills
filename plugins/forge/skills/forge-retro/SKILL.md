---
name: forge-retro
description: Preserve a recurring project-specific lesson after explicit user feedback or repeated agent mistakes. Use when the user asks to remember a correction, update future agent behavior, or run a retrospective. Do not trigger automatically after ordinary work or persist one-off task details.
---

# forge-retro

Keep only lessons likely to prevent the same mistake in future work.

## Procedure

1. Extract explicit corrections and repeated failure patterns using
   `references/retro-checklist.md`.
2. Discard one-off preferences, temporary debugging facts, and rules already
   captured or mechanically enforced.
3. Route each remaining lesson with `references/lesson-routing.md`.
4. Update an existing project instruction or local skill before creating a new
   one.
5. Create a project-local skill only for recurring, on-demand agent behavior,
   following `references/local-skill-authoring.md` and
   `references/local-skill-targets.md`.
6. Report the lesson, where it was preserved, and what was intentionally not
   persisted.

## Constraints

- Prefer code, tests, linters, and configuration when they can enforce the rule
  deterministically.
- Do not create status, idea, spec, or plan documents from a retrospective.
- Do not preserve secrets, private conversation details, or user frustration.
- Do not create a new skill for a single weak signal unless the user explicitly
  identifies it as a durable recurring rule.
- Do not modify installed Forge skills from an ordinary project.

## References

- `references/retro-checklist.md`
- `references/lesson-routing.md`
- `references/local-skill-authoring.md`
- `references/local-skill-targets.md`
