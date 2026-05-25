# Forge

Forge is a portable skill pack for repeatable software-project work with coding agents. It is meant to preserve project context, decisions, status, and local agent behavior without turning root files like `AGENTS.md` or `CLAUDE.md` into a messy knowledge base.

Forge is not a mandatory pipeline. Skills should compose into the smallest useful flow for the current task.

Common flows:

```text
Feature flow:
forge-idea -> forge-spec -> forge-plan -> forge-build -> forge-review -> forge-status

Bug flow:
forge-fix -> forge-review -> forge-status

Session learning flow:
user correction -> forge-retro -> local skill / spec / plan / ADR / status update

Resume flow:
forge-status -> forge-next
```

Every skill should also work on its own: use `forge-fix` for a bug, `forge-review` for a diff, `forge-adr` for a durable architectural choice, `forge-status` for handoff, and `forge-retro` to turn session lessons into the right artifact or project-local skill.

Agents should trigger Forge skills from normal user language when the intent matches the skill. Slash commands are a convenience, not the only entrypoint.

## Principles

Forge skills should be:

- concise;
- responsible for one thing;
- composable;
- progressively disclosed through `references/`;
- harness-agnostic;
- well-documented;
- portable;
- secure.

## Failure and edge-case rule

When implementation, review, or debugging exposes an error, failing validation, unclear edge case, or hidden design conflict, the agent should stop and diagnose before editing more code.

Do not patch symptoms. Find the real cause. If the cause is an incomplete spec, missing design decision, or ambiguous edge case, return to the spec/design discussion with the user instead of silently adding a special-case fix.

## Public skills

| Skill | Responsibility |
| --- | --- |
| `forge-init` | Initialize or repair the minimal Forge artifacts in a project. |
| `forge-next` | Resume context and choose the next normal skill or action. |
| `forge-status` | Keep `docs/status.md` accurate as the handoff point. |
| `forge-retro` | Preserve durable session lessons in the right artifact or local skill. |
| `forge-idea` | Explore and pressure-test a raw idea before requirements. |
| `forge-spec` | Define what should change and how success is judged. |
| `forge-plan` | Slice an approved spec into safe, verifiable implementation steps. |
| `forge-build` | Implement one small verified slice. |
| `forge-fix` | Reproduce, diagnose, and fix the root cause of a bug. |
| `forge-review` | Review a diff or completed slice against project intent. |
| `forge-adr` | Record a durable architectural decision. |

## Project artifacts

Default artifacts:

```text
docs/
  status.md
  specs/
  adr/
```

Optional artifacts created lazily:

```text
docs/
  ideas/
  plans/
```

Project-local skills usually live in `.agents/skills/` for multi-agent projects. Claude-only projects may use `.claude/skills/` when there is no multi-agent source of truth.
