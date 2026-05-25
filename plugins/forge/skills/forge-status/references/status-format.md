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

## Validation

- Passed: `...`
- Failed: `...`
- Not run: `...` because ...
- Blocked: `...` because ...

## Relevant artifacts

- Idea: `docs/ideas/...`
- Spec: `docs/specs/...`
- Plan: `docs/plans/...`
- ADR: `docs/adr/...`
```

## Guidelines

Keep the file short enough that an agent can read it at the start of every session.

Prefer bullets over prose.

Use links or paths to ideas, specs, plans, and ADRs instead of copying their contents.

Omit artifact lines that do not apply.

## Field meanings

`Current focus` is what the project is trying to accomplish right now.

`Recent work` is only recent enough to help continuation. It is not a changelog.

`Next action` should be actionable and specific.

`Open questions` should include only blockers or decisions that affect the next step.

`Validation` records what is known about checks. Do not claim anything passed unless it actually ran and passed.

`Relevant artifacts` should point to the documents that matter now.
