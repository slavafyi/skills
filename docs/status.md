# Project status

Updated: 2026-07-26

## Current focus

- The `common` plugin is implemented on `feature/common-youtube-transcript`.

## Recent work

- Added `common` to the Codex and Claude marketplaces at version `0.1.0`.
- Added the `youtube-transcript` skill from the dotfiles skill source.
- Excluded the source skill's `node_modules` directory.
- Matched the Forge and Shopify plugin manifest and README conventions.
- Updated the skill package metadata for Node 24.15 and pnpm 11.11.

## Next action

- Push `feature/common-youtube-transcript` and open a pull request when requested.

## Open questions

- None recorded.

## Validation

- Passed: JSON parsing for both plugin manifests and both marketplace manifests.
- Passed: `git diff --check`.
- Passed: byte comparison of `tsconfig.json` and `scripts/transcript.ts` against the source.
- Passed: `pnpm run typecheck` with the declared dependencies and pnpm 11.11.0.
- Passed: skill-creator `quick_validate.py`.
- Failed: plugin-creator validation requires expanded Codex interface metadata not used by the existing Forge and Shopify conventions.
- Not run: live YouTube transcript fetch.

## Relevant artifacts

- Plugin: `plugins/common/`
- Skill: `plugins/common/skills/youtube-transcript/`
