# Local skill authoring

Create a local skill only when a recurring task needs project-specific guidance
that the model would not reliably infer from code or repository instructions.

Use the Agent Skills shape:

```text
<skill-name>/
  SKILL.md
  references/  # optional
  scripts/     # optional
```

Minimal `SKILL.md`:

```md
---
name: project-example
description: Use when <specific trigger>. Applies <project-specific behavior>.
---

# project-example

## Rule

<Concrete behavior and why it matters.>

## Procedure

1. ...
2. ...

## Check

- ...
```

Rules:

- Match `name` to the directory and use lowercase kebab-case.
- Put the trigger and important gotcha in `SKILL.md`.
- Add references only when the task needs optional detail.
- Include project paths, examples, and validation that change agent behavior.
- Omit generic engineering advice, duplicated docs, secrets, and one-off task
  history.
- Update an existing coherent skill instead of creating an adjacent one.
