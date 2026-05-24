---
name: forge-next
description: Resume a project and choose the next normal action. Use at the start of a new session, after opening an unfamiliar repository, or whenever the user asks what to do next in a Forge-managed project.
---

# forge-next

Determine the current project state and choose the next normal action without guessing.

This is the default entrypoint for continuing work across sessions.

## Use when

Use this skill when the user says things like:

- "continue";
- "what is next?";
- "resume the project";
- "use forge-next";
- "where did we leave off?";
- "start from the project context".

## Procedure

1. Find the repository root.
   - Prefer the Git root when available.

2. Read current work state.
   - `docs/status.md`
   - recent files in `docs/specs/`
   - recent files in `docs/adr/`
   - local project skills using `references/local-skill-discovery.md`
   - README and package/config files when useful
   - current Git branch, status, and diff when available

3. If Forge is not initialized, route to `forge-init`.
   - Missing `docs/status.md` is the main signal.
   - Do not invent status from scratch unless the user asked to initialize.

4. Build a compact working picture.
   - Current focus.
   - Recent completed work.
   - In-progress changes.
   - Relevant spec or ADR.
   - Blocking questions.
   - Next normal action.

5. Choose the next skill or action.
   - Use `references/routing.md`.
   - Prefer the smallest safe next step.
   - Do not skip from vague idea to implementation.
   - If multiple directions are equally plausible, ask one short question.

6. Act only when the next action is unambiguous.
   - If the user asked you to proceed, take the selected safe step.
   - If the user asked for orientation only, summarize the next step and stop.
   - After material work, use or recommend `forge-status` to update `docs/status.md`.

## Output shape

When reporting orientation, use this shape:

```md
Current state:
- ...

Relevant context:
- ...

Next normal action:
- ...

Why:
- ...

I will not:
- ...
```

Keep it short. The goal is to continue work, not produce a project audit.

## Constraints

- Do not treat stale status as truth when code or Git diff contradicts it.
- Do not ignore local project skills.
- Do not create new docs unless routing to the appropriate skill.
- Do not implement without enough context, a clear request, or an existing spec.
- Do not create ADRs for ordinary changes.

## References

- `references/context-checklist.md`
- `references/local-skill-discovery.md`
- `references/routing.md`
