# Local skill authoring

Project-local skills should follow the [Agent Skills](https://agentskills.io) shape and stay focused.

## Supported structure

```text
<skill-name>/
  SKILL.md
  references/
  scripts/
  assets/
```

Only `SKILL.md` is required.

## Required frontmatter

```md
---
name: project-example
description: Use this skill when ...
---
```

Rules:

- `name` must match the directory name exactly.
- Use lowercase kebab-case.
- `description` must say what the skill does and when to use it.
- Avoid vague descriptions like "project rules" or "coding style".

## Good local skill names

Use scoped names:

```text
project-code-organization
project-testing-style
project-api-patterns
project-ui-patterns
project-review-checks
```

Avoid overly broad names:

```text
project-rules
project-memory
misc
style
```

## Content guidelines

A good local skill includes:

- the specific trigger;
- the rule or pattern;
- when to apply it;
- when not to apply it;
- examples or anti-examples;
- validation checks.

Keep the main `SKILL.md` compact. Put longer examples in `references/`.

## Create or update?

Update an existing skill when the new lesson belongs to the same scope.

Create a new skill only when the lesson is meaningfully different from existing local skills.

## What not to include

Do not include:

- one-off task details;
- secrets;
- user emotions or private conversation details;
- broad universal coding advice;
- rules already enforced by formatter, linter, or tests unless agents keep violating them.
