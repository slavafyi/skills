# Context checklist

Use this checklist to build enough context for the next action.

## Required

- Repository root
- Current Git branch
- Current Git status
- Current Git diff, if there are uncommitted changes
- `docs/status.md`, if present
- Recent files in `docs/specs/`, if present
- Recent files in `docs/adr/`, if present
- Project-local skills, if present

## Useful when relevant

- README
- package manager files
- app framework config
- test config
- CI config
- issue or PR context, if the user provided it

## Avoid

- Reading the whole repository without a reason.
- Treating generated files or build outputs as source of truth.
- Starting implementation because the next action "seems obvious" while status/specs are missing.
