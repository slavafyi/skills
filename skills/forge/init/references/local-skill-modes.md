# Local skill modes

Forge can create project-local skills when a durable project-specific process rule is needed.

Do not create local skill directories during initialization unless the user asks for them.

## Claude-only

Use this mode when the project is clearly only using Claude Code.

Signals:

- `.claude/` exists;
- `.claude/skills/` exists;
- `CLAUDE.md` exists and there is no evidence of other agents;
- the user says they are using Claude only.

Target:

```text
.claude/skills/<skill-name>/SKILL.md
```

## Default / non-Claude

Use this mode when the project is not clearly Claude-only and not explicitly multi-agent.

Target:

```text
.agents/skills/<skill-name>/SKILL.md
```

## Multi-agent / agent-agnostic

Use this mode when the user says the project should work across agents, or the project clearly uses both Claude and non-Claude agents.

Canonical target:

```text
.agents/skills/<skill-name>/SKILL.md
```

Claude bridge:

```text
.claude/skills/<skill-name> -> ../../.agents/skills/<skill-name>
```

Use symlinks for the Claude bridge. Do not create divergent copies.
