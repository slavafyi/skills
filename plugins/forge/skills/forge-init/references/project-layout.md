# Forge project layout

Default Forge project artifacts:

```text
docs/
  status.md
  specs/
  adr/
```

Optional artifacts are created lazily:

```text
docs/
  ideas/
  plans/
```

## `docs/status.md`

The short continuation point for future sessions.

It should tell a future agent:

- current focus;
- recent completed work;
- blockers or uncertainty;
- known validation state;
- next normal action;
- relevant ideas, specs, plans, or ADRs.

## `docs/specs/`

Requirements and acceptance criteria.

Use specs for what should change and how success is judged.

## `docs/plans/`

Optional implementation plans.

Use plans when a ready spec needs slicing, sequencing, risks, and validation per slice.

## `docs/adr/`

Architectural Decision Records.

Use ADRs only for durable technical decisions that future agents may otherwise undo or misunderstand.

## `docs/ideas/`

Optional idea notes.

Use idea notes for durable thoughts that are not ready to become specs. Do not create an idea note for every brainstorm.
