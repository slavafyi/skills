---
name: forge-init
description: Initialize or repair a repository for the Forge workflow. Use when a project has no docs/status.md, when the user asks to set up Forge, or when Forge project artifacts need to be created without changing application code.
---

# forge-init

Create the smallest useful Forge project footprint.

## Use when

- The user asks to set up Forge in a repository.
- The required continuation artifact, `docs/status.md`, is missing.
- Existing Forge project artifacts need minimal repair without changing application code.
- The user says "Set up Forge", "Initialize Forge", "Create project status", or "Repair Forge docs".

## Procedure

1. Find the repository root, preferring the Git root.
2. Inspect existing context: `docs/status.md`, existing artifact directories such as `docs/specs/`, `docs/plans/`, `docs/adr/`, and `docs/ideas/`, local skill directories, and root agent entrypoints.
3. Create the missing default artifact: `docs/status.md`.
4. Do not create empty artifact directories or placeholders for `docs/specs/`, `docs/plans/`, `docs/adr/`, or `docs/ideas/`; those directories are created only when writing real artifacts.
5. Mention placeholder-only artifact directories when found, but do not remove them automatically.
6. Keep agent entrypoints small. Use `references/agents-entrypoint.md` only when the user asks or an existing entrypoint needs a short pointer.
7. Keep generated project-facing text focused on the project: root entrypoints and default status text should use normal-language routing, not Forge branding, skill names, or slash commands.
8. Report created files, skipped files, placeholder-only directories noticed, and the next recommended skill.

## Constraints

- Do not change application source code.
- Do not invent project requirements.
- Do not create a large documentation tree.
- Do not create convenience-only artifact directories or placeholder files.
- Preserve existing project conventions when clear.

## References

- `references/project-layout.md`
- `references/status-template.md`
- `references/agents-entrypoint.md`
