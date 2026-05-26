# Plan: Lazy artifact folders

Created: 2026-05-26
Status: done

Spec: `docs/specs/lazy-artifact-folders.md`

## Strategy

First make initialization and layout documentation describe `docs/status.md` as the only default created artifact, without convenience directories or placeholders. Then make the artifact-writing skills explicit that parent directories are created only when writing real artifacts. Finally remove this repository's existing placeholder and bump Forge plugin manifests because the plugin documentation changed.

## Slices

### 1. Make initialization describe a status-only default footprint

Status: done

Outcome:
- `forge-init` no longer treats `docs/specs/` or `docs/adr/` as required default artifacts.
- Layout and README wording describe specs, plans, ADRs, and ideas as conventional locations created lazily when they contain real artifacts.

Acceptance criteria covered:
- After initialization in a fresh repository, the only required tracked project artifact is `docs/status.md`.
- Initialization does not create empty local artifact directories for `docs/specs/`, `docs/adr/`, `docs/ideas/`, or `docs/plans/`.
- Initialization does not create `.gitkeep` files or placeholder files for artifact directories.
- A fresh clone is valid even if empty artifact directories are absent.
- Forge layout documentation no longer implies empty directories must be versioned by default.

Likely files or modules:
- `plugins/forge/skills/forge-init/SKILL.md`
- `plugins/forge/skills/forge-init/references/project-layout.md`
- `plugins/forge/README.md`
- `plugins/forge/skills/forge-init/references/agents-entrypoint.md` if its artifact-location wording implies physical directories must exist.

Validation:
- Search Forge init docs for wording like `Create missing default artifacts`, `docs/specs/`, and `docs/adr/` to confirm they are no longer described as required default directories.
- Manually inspect README and layout examples for fresh-clone implications.

Result:
- `forge-init` now creates only `docs/status.md` by default and forbids convenience-only artifact directories and placeholders.
- Layout, README, entrypoint, and status-template wording now describe lazy artifact locations without requiring empty directories.

Dependencies:
- Ready spec: `docs/specs/lazy-artifact-folders.md`.

Risks:
- Documentation can still name conventional paths; the risk is wording that makes those paths sound like required empty directories.

Stop conditions:
- Stop if making the layout lazy would remove clear guidance about where specs, plans, ADRs, or ideas belong.

### 2. Make artifact writers create parent directories only for real artifacts

Status: done

Outcome:
- Skills that write specs, plans, ADRs, or idea notes clearly create the parent directory only when writing the first real artifact of that type.
- Missing artifact directories are not treated as repair failures when no artifact exists yet.

Acceptance criteria covered:
- The first real spec, plan, ADR, or idea note creates its parent directory when needed.
- A fresh clone is valid even if empty artifact directories are absent.
- `docs/specs/`, `docs/adr/`, `docs/ideas/`, and `docs/plans/` are conventional locations, not mandatory tracked directories.

Likely files or modules:
- `plugins/forge/skills/forge-spec/SKILL.md`
- `plugins/forge/skills/forge-plan/SKILL.md`
- `plugins/forge/skills/forge-adr/SKILL.md`
- `plugins/forge/skills/forge-adr/references/adr-template.md`
- `plugins/forge/skills/forge-idea/SKILL.md`
- `plugins/forge/skills/forge-retro/references/artifact-routing.md` if routing guidance needs the same lazy-directory rule.

Validation:
- Inspect each artifact-writing skill to confirm it can create its target path without assuming the parent directory already exists.
- Confirm no skill says a missing empty `docs/specs/`, `docs/adr/`, `docs/ideas/`, or `docs/plans/` directory is itself a problem.

Result:
- Spec, plan, ADR, and idea skills now say to create parent directories only when writing their real artifact files.
- ADR numbering guidance handles a missing `docs/adr/` directory by starting at `0001` and creating the directory only with the ADR file.
- Retro artifact routing now states that a missing empty artifact directory is not itself a reason to persist anything.

Dependencies:
- Slice 1 should define the default footprint first.

Risks:
- Adding too much operational detail to public `SKILL.md` files could make them noisy; prefer concise instructions and detailed reference updates when needed.

Stop conditions:
- Stop if a skill needs behavior that conflicts with the spec's rule against convenience-only directories.

### 3. Remove the placeholder and sync package metadata

Status: done

Outcome:
- This repository no longer tracks `docs/adr/.gitkeep`.
- Forge plugin manifests are bumped consistently after plugin documentation changes.
- The spec's acceptance criteria are marked implemented only after validation passes.

Acceptance criteria covered:
- `docs/adr/.gitkeep` is removed from this repository.
- Initialization does not create `.gitkeep` files or placeholder files for artifact directories.
- If Forge plugin package files change, all manifests that declare the Forge plugin version are bumped consistently.

Likely files or modules:
- `docs/adr/.gitkeep`
- `docs/specs/lazy-artifact-folders.md`
- `docs/status.md`
- `plugins/forge/.codex-plugin/plugin.json`
- `plugins/forge/.claude-plugin/plugin.json`

Validation:
- Confirm `docs/adr/.gitkeep` is absent.
- Confirm both Forge plugin manifests have the same bumped version.
- Run `git diff --check`.
- Review the final diff for implementation-only changes matching this plan.

Result:
- `docs/adr/.gitkeep` was removed from this repository.
- Forge plugin manifests were bumped to `0.1.6`.
- The lazy artifact folders spec was marked implemented after targeted validation passed.

Dependencies:
- Slices 1 and 2 should be complete before final metadata and status updates.

Risks:
- Removing the placeholder means `docs/adr/` may disappear from a fresh checkout until the first ADR exists; this is intended and should be reflected in docs.

Stop conditions:
- Stop if another manifest declaring the Forge plugin version is discovered and not updated.

## Plan-level risks

- Conventional artifact paths still need to be discoverable even when their directories are absent.
- Text searches may find allowed references to artifact paths; validation should distinguish path references from required-directory or placeholder behavior.
- Placeholder-only directories in other projects should be mentioned, not automatically removed; only this repository's `docs/adr/.gitkeep` is explicitly in scope for deletion.

## Checkpoints

- Before changing public API: not applicable; no skill names, commands, or artifact file naming conventions should change.
- Before touching data migrations: not applicable.
- Before declaring done: inspect initialization docs, artifact-writer docs, placeholder removal, manifest versions, and `git diff --check` output.

## Links

- Status: `docs/status.md`
- Spec: `docs/specs/lazy-artifact-folders.md`
