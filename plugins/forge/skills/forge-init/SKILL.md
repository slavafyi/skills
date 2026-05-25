---
name: forge-init
description: Initialize or repair a repository for the Forge workflow. Use when a project has no docs/status.md, when the user asks to set up Forge, or when Forge project artifacts need to be created without changing application code.
---

# forge-init

Create the smallest useful Forge project footprint.

## Use when

- The user asks to set up Forge in a repository.
- Required Forge artifacts such as `docs/status.md`, `docs/specs/`, or `docs/adr/` are missing.
- Existing Forge project artifacts need minimal repair without changing application code.
- The user says "Set up Forge", "Initialize Forge", "Create project status", or "Repair Forge docs".

## Procedure

1. Find the repository root, preferring the Git root.
2. Inspect existing context: `docs/status.md`, `docs/specs/`, `docs/plans/`, `docs/adr/`, local skill directories, and root agent entrypoints.
3. Create missing default artifacts: `docs/status.md`, `docs/specs/`, and `docs/adr/`.
4. Do not create optional folders like `docs/ideas/` or `docs/plans/` until a skill needs them.
5. Keep agent entrypoints small. Use `references/agents-entrypoint.md` only when the user asks or an existing entrypoint needs a short pointer.
6. Report created files, skipped files, and the next recommended skill.

## Constraints

- Do not change application source code.
- Do not invent project requirements.
- Do not create a large documentation tree.
- Preserve existing project conventions when clear.

## References

- `references/project-layout.md`
- `references/status-template.md`
- `references/agents-entrypoint.md`
