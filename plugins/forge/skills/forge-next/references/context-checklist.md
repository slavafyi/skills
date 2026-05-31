# Context checklist

Use this checklist to build enough context for the next action.

## Required

- Repository root
- Current Git branch
- Current Git status
- Current Git diff, if there are uncommitted changes
- `docs/status.md`, if present
- Recent files in `docs/specs/`, if present
- Recent files in `docs/plans/`, if present
- Recent files in `docs/adr/`, if present
- Project-local skills, if present

## Useful when relevant

- Recent files in `docs/ideas/`
- README
- package manager files
- app framework config
- test config
- CI config
- issue or PR context, if the user provided a URL or shorthand reference

## Issue and PR reference intake

Treat issue and PR references as lightweight context for normal Forge routing.

- Full issue or PR URLs are authoritative for provider and repository context.
- Shorthand references such as `#2`, `issue #2`, `PR #5`, or `pull request #5` require the current Git repository and an unambiguous remote.
- If shorthand resolution is ambiguous or blocked, ask for a full URL or repository instead of guessing.
- Use provider CLI tooling, CLI docs, built-in help, and command output to fetch the minimum useful issue or PR context.
- If the needed provider CLI is unavailable, unauthenticated, inaccessible, or blocked, report the blocker and ask for setup, a pasted summary, a full URL, or another context source.
- If multiple issue or PR references appear and the user's primary target is unclear, ask which reference should drive the next action.

## Avoid

- Reading the whole repository without a reason.
- Treating generated files or build outputs as source of truth.
- Starting implementation because the next action "seems obvious" while status/specs/plans are missing.
- Treating a stale plan as truth when code, tests, validation, or Git diff contradict it.
