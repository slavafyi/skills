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
- The user says "What's the status?", "Update status", "Write a handoff", "Save where we are", or asks for status from an issue/PR.

## Procedure

1. Inspect current state: Git branch/diff, recent commits when useful, status, relevant specs/plans/ADRs, local skills, and current conversation context.
2. If the prompt includes an issue or PR URL or shorthand reference, use provider CLI docs/help/output to fetch minimum useful status context before normal work; full URLs are authoritative, shorthand requires an unambiguous current Git remote, and blocked or ambiguous access should become a clear ask instead of guessed content.
3. Decide what changed: completed work, active focus, next action, open questions, blockers, validation, and relevant artifacts.
4. Update `docs/status.md` using `references/status-format.md`.
5. Keep it concise and remove stale details that would mislead the next session.
6. Report what changed and the next normal action.

## Constraints

- Do not record secrets, credentials, private tokens, or environment-specific values.
- Do not turn status into a changelog or project wiki.
- Do not claim validation passed unless it actually ran and passed.
- Do not create specs, plans, ADRs, or skills from this skill.
- Do not overwrite accurate human-authored context.
- Do not write provider status comments without explicit user confirmation.

## Provider comments

- Treat provider status comments as external mutations. Before creating or updating one, use structured ask/confirm when available; otherwise ask in chat and wait.
- Offer meaningful choices: no provider comment, new comment, update an existing comment when safely identifiable, summarized status, or full status.
- Include artifact paths only when expected to be visible in the relevant remote branch or provider context; for local-only artifacts, omit paths, mark them local/unpushed, or ask how to reference them.

## References

- `references/status-format.md`
- `references/update-policy.md`
