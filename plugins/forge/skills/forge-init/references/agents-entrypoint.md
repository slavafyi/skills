# Agent entrypoints

Forge should not turn root agent entrypoints into project memory.

## Default multi-agent mode

Use `AGENTS.md` as the source of truth when multiple agents may work in the repository.

Use a `CLAUDE.md -> AGENTS.md` symlink only when the project wants a Claude bridge.

## Claude-only mode

Use `CLAUDE.md` only when the project is intentionally Claude-only and there is no multi-agent source of truth.

## Entrypoint content

Keep the entrypoint short. Recommended maximum shape:

```md
# Agent instructions

This project uses Forge.

Start with `forge-next` when the next action is unclear.

Project artifacts:

- `docs/status.md`
- `docs/specs/`
- `docs/plans/`
- `docs/adr/`

Project-local skills may exist in `.agents/skills/` or another local skills directory.
```

Do not duplicate durable project knowledge here. Store requirements in specs, implementation order in plans, architectural decisions in ADRs, and repeatable agent behavior in project-local skills.
