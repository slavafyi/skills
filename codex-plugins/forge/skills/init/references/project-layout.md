# Forge project layout

Default Forge project artifacts:

```text
docs/
  status.md
  specs/
  adr/
```

## `docs/status.md`

The current continuation point for the project.

It should tell a future agent:

- what is currently active;
- what was recently completed;
- what is blocked or uncertain;
- what the next normal action is;
- which specs or ADRs matter now.

## `docs/specs/`

Feature or change specifications.

Use specs for "what we are trying to build or change".

## `docs/adr/`

Architectural Decision Records.

Use ADRs only for important technical or architectural decisions that future agents may otherwise undo or misunderstand.
