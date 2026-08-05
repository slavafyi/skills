# Harden

Harden is a portable set of focused software-engineering skills for coding
agents. It diagnoses failures, reviews changes, records durable decisions, and
preserves recurring lessons.

**Harden proves the work holds.** It is not a project-management pipeline and
does not own routine implementation, planning, task state, or session handoff.

## Skills

| Skill | Use it for |
| --- | --- |
| `harden-fix` | Reproduce and fix the root cause of broken behavior. |
| `harden-review` | Review a diff, branch, commit, or pull request. |
| `harden-adr` | Record a costly, durable architectural decision. |
| `harden-retro` | Preserve a recurring lesson from explicit user feedback. |

Clear implementation requests, ordinary test additions, planning requests,
and session continuation should normally use the coding harness directly.

## Persistent artifacts

Harden-specific durable artifacts are limited to:

```text
docs/adr/<number>-<slug>.md
.agents/skills/<skill-name>/SKILL.md
```

ADRs are for decisions that are costly to reverse and not obvious from code,
configuration, or tests. Project-local skills are for recurring agent behavior
that cannot be enforced more reliably in code, tests, linters, or
configuration.

## Install

### Codex

```bash
codex plugin marketplace add slavafyi/skills
codex plugin add harden@slavafyi
```

### Claude

```bash
claude plugin marketplace add slavafyi/skills
claude plugin install harden@slavafyi
```

### OpenCode, Pi, and other agents

```bash
npx skills add slavafyi/skills --skill harden-fix --skill harden-review \
  --skill harden-adr --skill harden-retro
```

## Migration from Forge v0.3

The former `forge-fix`, `forge-review`, `forge-adr`, and `forge-retro` skills
moved to Harden and are now named `harden-fix`, `harden-review`, `harden-adr`,
and `harden-retro`. Install Harden and update any explicit skill references.
