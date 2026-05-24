# Status format

Use this format for `docs/status.md`.

```md
# Project status

Updated: YYYY-MM-DD

## Current focus

- ...

## Recent work

- ...

## Next action

- ...

## Open questions

- ...

## Relevant artifacts

- Spec: `docs/specs/...`
- ADR: `docs/adr/...`
```

## Guidelines

Keep the file short enough that an agent can read it at the start of every session.

Prefer bullets over prose.

Use links or paths to specs and ADRs instead of copying their contents.

## Field meanings

`Current focus` is what the project is trying to accomplish right now.

`Recent work` is only recent enough to help continuation. It is not a changelog.

`Next action` should be actionable and specific.

`Open questions` should include only blockers or decisions that affect the next step.

`Relevant artifacts` should point to the documents that matter now.
