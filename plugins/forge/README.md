# Forge

Forge is a portable skill pack for understanding and shaping software work
before implementation.

**Forge shapes the work.** It does not own implementation, debugging, review,
task state, or session handoff.

## Skills

| Skill | Use it for |
| --- | --- |
| `forge-task` | Clarify a task already described in the conversation or repository. |
| `forge-ticket` | Research an external ticket and its complete accessible context. |

Use `forge-task` for local task shaping. Use `forge-ticket` for identifiers or
URLs from Jira, Linear, Asana, ClickUp, GitHub, GitLab, and similar work-item
systems.

Both skills report findings in the conversation by default. They do not create
task, research, spec, or plan documents unless the user asks for one.

## Install

### Codex

```bash
codex plugin marketplace add slavafyi/skills
codex plugin add forge@slavafyi
```

### Claude

```bash
claude plugin marketplace add slavafyi/skills
claude plugin install forge@slavafyi
```

### OpenCode, Pi, and other agents

```bash
npx skills add slavafyi/skills --skill forge-task --skill forge-ticket
```

## Migration from v0.3

Version 0.4 narrows Forge to shaping new work. The former `forge-fix`,
`forge-review`, `forge-adr`, and `forge-retro` skills moved to the Harden plugin
and are now named `harden-fix`, `harden-review`, `harden-adr`, and
`harden-retro`.
