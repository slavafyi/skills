# Plan: Project-centered initialization wording

Created: 2026-05-26
Status: done

Spec: `docs/specs/project-centered-init-wording.md`

## Strategy

Make the project-facing generated/recommended text neutral first, then update the initialization skill guidance so future repairs preserve that rule, and finally bump plugin manifests because the Forge plugin package changes.

## Slices

### 1. Neutralize generated/recommended project text

Status: done

Outcome:
- The default agent entrypoint example and status template point agents at project continuation artifacts using normal language only.

Acceptance criteria covered:
- The recommended `AGENTS.md` / `CLAUDE.md` entrypoint content contains no `Forge`, `forge-*`, or `/forge-*` wording.
- The recommended entrypoint tells agents to use `docs/status.md` as the continuation point when the next action is unclear.
- The default status template does not describe the current focus or recent work as a Forge workflow step.
- The default status template uses project-first wording for initialized artifacts, such as project continuation artifacts or project context.
- The default status template contains no `Forge`, `forge-*`, or `/forge-*` wording.

Likely files or modules:
- `plugins/forge/skills/forge-init/references/agents-entrypoint.md`
- `plugins/forge/skills/forge-init/references/status-template.md`

Validation:
- Inspect the example entrypoint and status template manually.
- Search the generated/recommended template text for `Forge`, `forge-`, and `/forge-`.

Dependencies:
- Resolved spec decision: status routing uses normal language only.

Risks:
- Removing exact skill names may reduce routing clarity for agents that rely on command names.

Stop conditions:
- Stop if neutral wording cannot clearly tell agents what to do next without reintroducing skill names.

### 2. Document the initialization repair rule

Status: done

Outcome:
- The initialization skill tells agents how to keep root entrypoints and status templates project-centered during init or repair.

Acceptance criteria covered:
- Root entrypoints remain short and do not duplicate durable project knowledge.
- Forge's own plugin README, skill names, skill descriptions, and internal references can still use Forge vocabulary.

Likely files or modules:
- `plugins/forge/skills/forge-init/SKILL.md`
- `plugins/forge/skills/forge-init/references/agents-entrypoint.md`
- `plugins/forge/skills/forge-init/references/status-template.md`

Validation:
- Confirm the guidance distinguishes project-facing generated text from internal Forge documentation.
- Confirm the init procedure still creates only `docs/status.md`, `docs/specs/`, and `docs/adr/` by default.

Dependencies:
- Slice 1 wording should exist first so the rule references concrete examples.

Risks:
- Over-explaining the rule could make the public skill too verbose.

Stop conditions:
- Stop if the skill guidance starts defining new workflow behavior beyond wording rules.

### 3. Bump Forge plugin manifests and run final checks

Status: done

Outcome:
- Plugin package metadata reflects the documentation change, and the changed wording passes targeted validation.
- Manifest versions have already been bumped to satisfy repository versioning policy after the first plugin documentation change.

Acceptance criteria covered:
- Forge's own plugin README, skill names, skill descriptions, and internal references can still use Forge vocabulary.
- Repository versioning rule is satisfied for the changed Forge plugin package.

Likely files or modules:
- `plugins/forge/.codex-plugin/plugin.json`
- `plugins/forge/.claude-plugin/plugin.json`

Validation:
- Verify both Forge plugin manifests use version `0.1.5`.
- Run targeted text searches for forbidden wording in project-facing templates.
- Review `git diff` to confirm changes are limited to intended project docs, Forge init docs, and Forge plugin manifests.

Result:
- Manifest versions are `0.1.5` in both Forge plugin manifests.
- Project-facing template blocks contain no `Forge`, `forge-`, or `/forge-` tokens.
- Removed branded routing phrases are absent from `forge-init` docs.
- `git diff --check` passed.

Dependencies:
- Slices 1 and 2 changed the plugin package.

Risks:
- Missing a manifest would violate the repository versioning rule.

Stop conditions:
- Stop if another manifest declaring the Forge plugin version is discovered and not updated.

## Plan-level risks

- Fully normal-language routing may be less explicit than `forge-next`; validation needs to check the replacement still gives agents a clear next step.
- Text searches can produce allowed matches from Forge's internal docs; validation should focus on generated/recommended project-facing template content.

## Checkpoints

- Before changing public API: not applicable.
- Before touching data migrations: not applicable.
- Before declaring done: inspect the entrypoint example, status template, manifest versions, and targeted text-search output.

## Links

- Status: `docs/status.md`
- Spec: `docs/specs/project-centered-init-wording.md`
