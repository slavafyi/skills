# Agent entrypoints

Forge uses one root-level agent entrypoint per project mode.

## Claude-only

Use:

`CLAUDE.md`

Do not create `AGENTS.md` unless the user asks for multi-agent support.

## Default

Use:

`AGENTS.md`

This is the default for non-Claude and agent-agnostic agents.

## Multi-agent / agent-agnostic

Use:

`AGENTS.md`

Then create:

`CLAUDE.md -> AGENTS.md`

`AGENTS.md` is the source of truth. `CLAUDE.md` must be a symlink, not a separate copy.

## Entrypoint content

Keep the entrypoint short. It should not become project memory.

Recommended content:

```md
# Agent instructions

This project uses Forge.

Start with `forge-next` when the next action is unclear.

Project artifacts live in:

- `docs/status.md`
- `docs/specs/`
- `docs/adr/`

Project-local skills may exist in the agent-specific local skills directory.
```

Do not duplicate durable project knowledge here. Store feature requirements in specs and architectural decisions in ADR.
