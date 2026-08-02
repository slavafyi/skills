# Forge

Forge is a portable set of focused software-engineering skills for coding
agents.

## Default behavior

**Direct work by default. Persistent artifacts only when context loss or
reversal risk justifies them.**

For a clear task, the agent should inspect the relevant code, make the smallest
complete change, validate it, review the diff, and report the result. It should
not invoke Forge merely to add process around routine implementation.

Forge is intentionally not a project-management pipeline. It does not own
planning, implementation, testing strategy, task state, or session handoff.
Use the coding harness, issue tracker, pull request, and repository conventions
already available for those jobs.

## Skills

| Skill | Use it for |
| --- | --- |
| `forge-fix` | Reproduce and fix the root cause of broken behavior. |
| `forge-review` | Review a diff, branch, commit, or pull request. |
| `forge-adr` | Record a costly, durable architectural decision. |
| `forge-retro` | Preserve a recurring lesson from explicit user feedback. |

Clear implementation requests, ordinary test additions, planning requests,
and session continuation should normally use the harness directly without a
Forge skill.

## Persistent artifacts

Forge-specific durable artifacts are limited to:

```text
docs/adr/<number>-<slug>.md
.agents/skills/<skill-name>/SKILL.md
```

ADRs are for decisions that are costly to reverse and not obvious from code,
configuration, or tests. Project-local skills are for recurring agent behavior
that cannot be enforced more reliably in code, tests, linters, or configuration.
Use an established harness-specific local skill path, such as `.claude/skills/`,
when the project is intentionally single-harness. Create any location only when
a real artifact is justified.

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
npx skills add slavafyi/skills --skill forge-fix --skill forge-review \
  --skill forge-adr --skill forge-retro
```

## Migration from v0.2

Version 0.3 removes `forge-build`, `forge-idea`, `forge-init`, `forge-next`,
`forge-plan`, `forge-spec`, `forge-status`, and `forge-test`. Use direct harness
behavior for ordinary work, native planning and handoff for session workflow,
and existing project or issue-tracker artifacts for task state.
