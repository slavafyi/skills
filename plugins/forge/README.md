# Forge

Forge is a portable skill pack for understanding and shaping software work
before implementation.

**Forge shapes the work.** It does not own implementation, debugging, review,
task state, or session handoff.

## Skills

| Skill | Use it for |
| --- | --- |
| `forge-task` | Read, clarify, and assess the readiness of a coding task. |

Use `forge-task` when a task, issue, or PR follow-up needs investigation before
coding. Skip it when the requested change is already explicit and ready to
implement.

The skill reports its findings in the conversation by default. It does not
create task, spec, or plan documents unless the user asks for one.

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
npx skills add slavafyi/skills --skill forge-task
```

## Migration from v0.3

Version 0.4 narrows Forge to shaping new work. The former `forge-fix`,
`forge-review`, `forge-adr`, and `forge-retro` skills moved to the Harden plugin
and are now named `harden-fix`, `harden-review`, `harden-adr`, and
`harden-retro`.
