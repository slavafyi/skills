---
name: forge-status
description: Create or update docs/status.md as the project continuation point. Use after meaningful work, before ending a session, or when the current project state is stale, missing, or confusing.
---

# forge-status

Maintain `docs/status.md` as the short continuation point for future sessions.

## Use when

- The user asks for current project status or a handoff note.
- Meaningful work changed the active focus, validation state, blockers, or next action.
- `docs/status.md` is missing, stale, misleading, or too noisy for a future session.
- The user says "What's the status?", "Update status", "Write a handoff", or "Save where we are".

## Procedure

1. Inspect current state: Git branch/diff, recent commits when useful, status, relevant specs/plans/ADRs, local skills, and current conversation context.
2. Decide what changed: completed work, active focus, next action, open questions, blockers, validation, and relevant artifacts.
3. Update `docs/status.md` using `references/status-format.md`.
4. Keep it concise and remove stale details that would mislead the next session.
5. Report what changed and the next normal action.

## Constraints

- Do not record secrets, credentials, private tokens, or environment-specific values.
- Do not turn status into a changelog or project wiki.
- Do not claim validation passed unless it actually ran and passed.
- Do not create specs, plans, ADRs, or skills from this skill.
- Do not overwrite accurate human-authored context.

## References

- `references/status-format.md`
- `references/update-policy.md`
