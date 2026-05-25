---
name: forge-next
description: Resume a project and choose the next normal action. Use at the start of a new session, after opening an unfamiliar repository, or whenever the user asks what to do next in a Forge-managed project.
---

# forge-next

Determine the current project state and route to the smallest safe next skill or action.

## Use when

- A session starts or resumes and the project state is not yet clear.
- The user asks what to do next in a Forge-managed project.
- Existing context needs to be read and routed to the smallest safe next skill or action.
- The user says "What's next?", "Where did we stop?", "Resume the project", or "What should I work on now?".

## Procedure

1. Find the repository root, preferring the Git root.
2. Read the current work state with `references/context-checklist.md`.
3. If `docs/status.md` is missing, route to `forge-init`.
4. Build a compact picture: current focus, recent work, active spec/plan/ADR, uncommitted changes, blockers, validation state, and next likely action.
5. Use `references/routing.md` to choose the next skill.
6. Act only when the next action is unambiguous. Otherwise ask one short question with the most likely options.

## Output

```md
Current state:
- ...

Relevant context:
- ...

Next normal action:
- ...

Why:
- ...

Will not do yet:
- ...
```

## Constraints

- Do not treat stale status as truth when code or Git diff contradicts it.
- Do not skip from vague idea to implementation.
- Do not implement without enough context, a clear request, or an existing spec/plan.
- Do not patch failures or edge cases before the root cause/design question is understood.
- Do not create docs unless routing to the appropriate skill.

## References

- `references/context-checklist.md`
- `references/routing.md`
