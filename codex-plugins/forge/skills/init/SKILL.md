---
name: forge-init
description: Initialize or repair a repository for the Forge workflow. Use when a project has no docs/status.md, when the user asks to set up Forge, or when Forge project artifacts need to be created without changing application code.
---

# forge-init

Initialize the repository for Forge with the smallest useful project footprint.

Forge project artifacts live in `docs/` by default:

```text
docs/status.md
docs/specs/
docs/adr/
```

## Use when

Use this skill when:

- the user asks to initialize Forge in a project;
- `forge-next` cannot find `docs/status.md`;
- the project has partial Forge artifacts that need repair;
- the user wants a clean project setup for future agent sessions.

## Procedure

1. Find the repository root.
   - Prefer the Git root when available.
   - Otherwise use the current working directory.

2. Inspect existing project context.
   - Check for `docs/status.md`, `docs/specs/`, and `docs/adr/`.
   - Check for `AGENTS.md`, `CLAUDE.md`, `.claude/`, `.agents/`, and existing local skill directories.
   - Do not overwrite existing project documentation without a reason.

3. Create missing Forge project artifacts.
   - Create `docs/status.md` from `references/status-template.md` when absent.
   - Create `docs/specs/`.
   - Create `docs/adr/`.
   - Use `.gitkeep` files only when the environment cannot preserve empty directories.

4. Handle project-local skill directories only when needed.
   - Do not create local skill directories just because Forge is initialized.
   - If the user asks for local project skills, apply `references/local-skill-modes.md`.
   - If the project is Claude-only, use `.claude/skills/`.
   - If the project is default/non-Claude, use `.agents/skills/`.
   - If the project is explicitly multi-agent or agent-agnostic, use `.agents/skills/` and symlink individual skills into `.claude/skills/`.

5. Keep agent entrypoints small.
   - Do not stuff process rules into `AGENTS.md` or `CLAUDE.md`.
   - Only create or update an entrypoint when the user asks or the file already exists and needs a short pointer.
   - Use `references/agents-entrypoint.md` as the maximum shape.

6. Report the result.
   - List created files and directories.
   - List skipped existing files.
   - State the next recommended Forge skill, usually `forge-status` or `forge-next`.

## Constraints

- Do not change application source code.
- Do not invent project requirements.
- Do not create large documentation structures.
- Do not create project-local skills unless requested or required by a retro result.
- Preserve existing conventions when they are already clear.

## References

- `references/project-layout.md`
- `references/status-template.md`
- `references/local-skill-modes.md`
- `references/agents-entrypoint.md`
