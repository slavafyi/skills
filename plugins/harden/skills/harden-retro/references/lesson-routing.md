# Lesson routing

Use the most reliable existing home for each lesson:

- Enforceable invariant -> code, type, test, linter, schema, or configuration.
- Always-applicable repository convention -> existing `AGENTS.md` or equivalent
  project instruction, kept concise.
- Recurring behavior needed only for a class of tasks -> existing or new
  project-local skill.
- Costly cross-cutting technical decision -> `harden-adr`.
- One-off preference, task state, or temporary fact -> no persistence.

Do not copy one lesson into several artifacts. Link to an existing source of
truth when another artifact needs context.
