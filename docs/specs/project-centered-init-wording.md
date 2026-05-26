# Spec: Project-centered initialization wording

Created: 2026-05-26
Status: implemented

## Goal

Initialization should create or recommend project-facing artifacts that keep the agent's attention on the project, not on the Forge brand or workflow mechanics.

Root agent entrypoints should be especially small and neutral. Project continuation docs should use normal-language routing instead of naming workflow skills or slash commands.

## Background

Current `forge-init` guidance recommends an agent entrypoint that says:

- `This project uses Forge.`
- `Start with forge-next when the next action is unclear.`

The current status template also says:

- `Forge project artifacts were initialized.`
- `Use forge-next to inspect the project and choose the next normal action.`

This makes newly initialized projects feel centered on the tool workflow instead of the actual project state.

## Scope

### In scope

- Default `AGENTS.md` / `CLAUDE.md` entrypoint wording recommended by initialization.
- Default `docs/status.md` wording produced or recommended by initialization.
- Guidance for when project-facing docs may mention skill names or slash commands.

### Out of scope

- Renaming Forge skills, commands, plugin metadata, or public documentation.
- Removing Forge vocabulary from Forge's own skill docs, README, or implementation internals.
- Changing which artifacts initialization creates.
- Designing a new project workflow.

## Requirements

- Root agent entrypoints generated or recommended by initialization must not mention `Forge`, `forge-*`, or `/forge-*`.
- Root agent entrypoints should point agents to project continuation artifacts, especially `docs/status.md`, without naming the workflow system.
- Root agent entrypoints should remain short and must not duplicate durable project knowledge.
- `docs/status.md` should keep `Current focus` and `Recent work` project-centered, not workflow-centered.
- `docs/status.md` should use normal-language routing in `Next action` instead of naming `forge-*` skills or `/forge-*` commands.
- Initialization should not anonymize Forge's internal docs or public skill documentation; only project-facing generated/recommended artifacts need neutral wording.

## Acceptance criteria

- [x] The recommended `AGENTS.md` / `CLAUDE.md` entrypoint content contains no `Forge`, `forge-*`, or `/forge-*` wording.
- [x] The recommended entrypoint tells agents to use `docs/status.md` as the continuation point when the next action is unclear.
- [x] The default status template does not describe the current focus or recent work as a Forge workflow step.
- [x] The default status template uses project-first wording for initialized artifacts, such as project continuation artifacts or project context.
- [x] The default status template contains no `Forge`, `forge-*`, or `/forge-*` wording.
- [x] Forge's own plugin README, skill names, skill descriptions, and internal references can still use Forge vocabulary.

## Behavior details

- Preferred entrypoint style:
  - Identify the file as agent instructions.
  - Direct agents to `docs/status.md` for continuity.
  - List relevant artifact locations only when useful.
  - Warn not to duplicate durable project knowledge in the entrypoint.
- Avoid in root entrypoints:
  - `This project uses Forge.`
  - `Start with forge-next.`
  - Any slash-command instruction such as `/forge-next`.
- Preferred status style:
  - `Current focus` names the project task or says it is not set yet.
  - `Recent work` describes project artifact changes without tool branding.
  - `Next action` describes the next project step in normal language rather than naming a skill or slash command.

## Edge cases

- If a project already has a branded entrypoint, repair should preserve unrelated project instructions while removing Forge-branded routing language.
- If a project explicitly asks for Forge-branded entrypoint text, that user preference can override the default.
- If a target agent cannot reliably infer skill routing from normal language, prefer clearer normal-language instructions over exact skill names in project-facing templates.

## Constraints

- Existing ADRs: none known.
- Project-local skills: none relevant beyond the Forge skills in this repository.
- Compatibility: generated project docs should remain useful for multiple coding agents, including agents that do not know Forge by name.
- Security/privacy: no new secrets or environment-specific paths.
- Performance: not applicable.

## Validation expectations

- Targeted checks: inspect initialization references for project-facing wording.
- Broader regression checks: verify generated/recommended artifact lists and initialization responsibilities are unchanged.
- Manual checks: confirm entrypoint examples read as project instructions rather than workflow marketing.

## Open questions

- None.

## Links

- Status: `docs/status.md`
