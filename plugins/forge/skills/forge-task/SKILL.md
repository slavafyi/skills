---
name: forge-task
description: Read and shape a new coding task before implementation. Use when the user asks to inspect, understand, clarify, scope, or prepare a task, issue, or PR follow-up, especially when expected behavior, acceptance criteria, relevant code, or readiness is unclear. Do not use for direct implementation of an already clear task, bug diagnosis, code review, implementation planning, or session handoff.
---

# forge-task

Understand the task well enough to decide what should happen next. Do not
implement it.

## Procedure

1. Read the complete task source and any directly relevant linked context. If
   access is blocked, ask for access or pasted content instead of inventing it.
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

- Do not edit code or create task, spec, or plan documents unless requested.
- Do not turn implementation guesses into requirements.
- Do not scan the whole repository when targeted inspection is enough.
- Do not write to an issue tracker, review system, or other external provider.
- Do not add process around a task that is already explicit and ready to do.

## References

- `references/task-checklist.md`
