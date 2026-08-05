---
name: forge-task
description: Read and shape a coding task that is already described in the conversation or repository. Use when the user asks to clarify scope, expected behavior, acceptance criteria, relevant code, or implementation readiness without pointing to an external work item. Do not use for Jira, Linear, Asana, ClickUp, GitHub, GitLab, or other external ticket identifiers or URLs; use forge-ticket instead. Do not use for direct implementation, bug diagnosis, code review, implementation planning, or session handoff.
---

# forge-task

Understand a locally described task well enough to decide what should happen
next. Do not implement it.

## Procedure

1. Read the complete task text and directly relevant repository context.
2. Read repository instructions, Git state, relevant documentation, and only
   the code, tests, and history needed to understand current behavior.
3. Build the task brief using `references/task-checklist.md`.
4. Separate stated facts, evidence-backed inferences, assumptions, and unknowns.
5. Ask only about ambiguity that would materially change behavior, scope,
   compatibility, data safety, security, or acceptance criteria.
6. State whether the task is ready for direct implementation, needs a user
   decision, needs more investigation, or needs an implementation plan.

## Output

- Goal and expected outcome
- Current behavior and relevant evidence
- Scope, constraints, and acceptance criteria
- Unknowns or assumptions
- Likely affected areas and validation signal
- Readiness and next action

## Constraints

- Route external ticket identifiers and URLs to `forge-ticket`.
- Do not edit code or create task, spec, or plan documents unless requested.
- Do not turn implementation guesses into requirements.
- Do not scan the whole repository when targeted inspection is enough.
- Do not add process around a task that is already explicit and ready to do.

## References

- `references/task-checklist.md`
