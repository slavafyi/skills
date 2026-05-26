# Forge project layout

Default Forge project artifact:

```text
docs/
  status.md
```

Other artifact locations are created lazily when a real artifact is written:

```text
docs/
  specs/<slug>.md
  plans/<slug>.md
  adr/<number>-<slug>.md
  ideas/<slug>.md
```

Do not create empty artifact directories or placeholder files just to make Git track the layout. A fresh clone is valid when these directories are absent and no artifacts of that type exist yet.

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

Create this directory when writing the first spec.

## `docs/plans/`

Optional implementation plans.

Use plans when a ready spec needs slicing, sequencing, risks, and validation per slice.

Create this directory when writing the first plan.

## `docs/adr/`

Architectural Decision Records.

Use ADRs only for durable technical decisions that future agents may otherwise undo or misunderstand.

Create this directory when writing the first ADR.

## `docs/ideas/`

Optional idea notes.

Use idea notes for durable thoughts that are not ready to become specs. Do not create an idea note for every brainstorm.

Create this directory when writing the first idea note.
