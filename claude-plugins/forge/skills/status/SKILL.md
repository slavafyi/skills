---
name: forge-status
description: Create or update docs/status.md as the project continuation point. Use after meaningful work, before ending a session, or when the current project state is stale, missing, or confusing.
---

# forge-status

Maintain `docs/status.md` as the short continuation point for future sessions.

Status is not a memory file, rules file, changelog, or project wiki.

## Use when

Use this skill when:

- meaningful work was completed;
- a session is ending;
- `docs/status.md` is stale or missing;
- `forge-next` cannot determine the current focus;
- the user asks to update status.

## Procedure

1. Inspect the current state.
   - Current Git branch and diff.
   - Recent commits when useful.
   - `docs/status.md`, if present.
   - Relevant specs in `docs/specs/`.
   - Relevant ADRs in `docs/adr/`.
   - The current conversation context, if available.

2. Decide what changed.
   - Completed work.
   - Current active focus.
   - Remaining next action.
   - Open questions or blockers.
   - Relevant artifacts.

3. Update `docs/status.md`.
   - Use `references/status-format.md`.
   - Keep it concise.
   - Preserve useful existing context.
   - Remove stale details that would mislead the next session.

4. Do not create extra documentation.
   - Do not create new specs or ADRs unless routed to the matching skill.

5. Report what changed.
   - Mention the updated status file.
   - State the next normal action.

## Constraints

- Do not record secrets, credentials, private tokens, or environment-specific values.
- Do not turn status into a long historical log.
- Do not claim validation passed unless it was actually run.
- Do not overwrite human-authored status sections that remain accurate.

## References

- `references/status-format.md`
- `references/update-policy.md`
