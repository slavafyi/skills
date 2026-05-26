# Spec: Lazy artifact folders

Created: 2026-05-26
Status: implemented

## Goal

Forge initialization should avoid creating or versioning empty artifact directories. The default initialized footprint should contain only the real continuation artifact, `docs/status.md`; other artifact directories should appear only when they contain real project artifacts.

## Background

The current initialization guidance treats `docs/specs/` and `docs/adr/` as default artifacts alongside `docs/status.md`. In this project, `docs/adr/.gitkeep` was added to preserve an otherwise empty ADR directory in Git.

That placeholder is not useful project knowledge. It makes the repository track an empty workflow slot rather than a real artifact. The preferred behavior is lazy artifact folders: create artifact directories only when writing real artifacts, and do not add placeholder files solely to force Git versioning.

## Scope

### In scope

- Default `forge-init` artifact behavior and wording.
- Generated or repaired Forge project footprint expectations.
- Documentation that describes the default and optional project artifact layout.
- Removal of the existing `docs/adr/.gitkeep` placeholder from this repository.

### Out of scope

- Changing Forge skill names, command names, or artifact file naming conventions.
- Changing when specs, plans, ADRs, or idea notes are written by their respective skills.
- Adding replacement placeholder files such as `README.md` solely to preserve empty directories.
- Changing application source code.

## Requirements

- `docs/status.md` must be the only default versioned artifact created by initialization.
- `forge-init` must not create empty local artifact directories such as `docs/specs/` or `docs/adr/` for convenience.
- `forge-init` must not create `.gitkeep` or any other placeholder solely to force Git tracking.
- `docs/specs/`, `docs/adr/`, `docs/ideas/`, and `docs/plans/` must be created or versioned when their first real artifact file is written.
- Documentation must make clear that artifact directories are recognized project locations even when a fresh clone does not physically contain empty directories.
- This repository must not retain `docs/adr/.gitkeep` after the change.
- If Forge plugin package files change, all manifests that declare the Forge plugin version must be bumped consistently.

## Acceptance criteria

- [x] After initialization in a fresh repository, the only required tracked project artifact is `docs/status.md`.
- [x] Initialization does not create empty local artifact directories for `docs/specs/`, `docs/adr/`, `docs/ideas/`, or `docs/plans/`.
- [x] Initialization does not create `.gitkeep` files or placeholder files for `docs/specs/`, `docs/adr/`, `docs/ideas/`, or `docs/plans/`.
- [x] A fresh clone is valid even if empty artifact directories are absent.
- [x] The first real spec, plan, ADR, or idea note creates its parent directory when needed.
- [x] `docs/adr/.gitkeep` is removed from this repository.
- [x] Forge layout documentation no longer implies empty directories must be versioned by default.

## Behavior details

- Treat `docs/status.md` as the continuation point and only mandatory initialized file.
- Treat `docs/specs/`, `docs/adr/`, `docs/ideas/`, and `docs/plans/` as conventional artifact locations, not mandatory tracked directories.
- `forge-init` should not prepare convenience-only artifact directories locally.
- A missing artifact directory is not an error when no artifact of that type exists yet.

## Edge cases

- If a project already contains real files in `docs/specs/`, `docs/adr/`, `docs/ideas/`, or `docs/plans/`, initialization or repair must preserve them.
- If a project already contains placeholder-only artifact directories, repair should mention them but must not remove them automatically.
- This repository's existing `docs/adr/.gitkeep` is an explicit in-scope cleanup because the maintainer requested removing it before the current work is pushed.
- If Git cannot represent an empty directory, Forge should not work around that with generated placeholders.
- If a repository has its own documented placeholder convention, Forge should not override it automatically without user confirmation.

## Constraints

- Existing ADRs: none known.
- Project-local skills: Forge skills in `plugins/forge/skills/` define the workflow behavior.
- Compatibility: initialized projects should remain understandable to agents that only read `docs/status.md` and documented artifact paths.
- Security/privacy: no secrets, credentials, or machine-specific paths.
- Performance: not applicable.

## Validation expectations

- Targeted checks:
  - Confirm `docs/adr/.gitkeep` is absent.
  - Search Forge initialization docs for `.gitkeep` and placeholder-preservation wording.
  - Inspect layout docs to confirm empty directories are described as lazy and not created during initialization.
- Broader regression checks:
  - Confirm status initialization still produces `docs/status.md`.
  - Confirm specs, plans, ADRs, and idea notes still name their conventional paths.
  - Confirm Forge plugin manifests stay in sync if plugin files change.
- Manual checks:
  - Confirm the README and initialization docs do not imply fresh clones must contain empty artifact directories.

## Open questions

- None.

## Links

- Status: `docs/status.md`
- Related spec: `docs/specs/project-centered-init-wording.md`
