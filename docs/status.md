# Project status

Updated: 2026-07-25

## Current focus

- The initial Shopify plugin and theme-preview skill are ready for review in draft PR #3.

## Recent work

- Added the Shopify plugin to the Codex and Claude marketplaces.
- Added `shopify-theme-dev-preview` for remote `preview_theme_id` verification through Chrome DevTools MCP.
- Added workflow evals and balanced positive/negative activation queries.
- Matched the Shopify plugin manifest structure to the existing Forge plugin convention at version `0.1.0`.
- Opened draft PR #3 from `feature/shopify-theme-preview`.

## Next action

- Review and merge draft PR #3: https://github.com/slavafyi/skills/pull/3

## Open questions

- None affecting the PR.

## Validation

- Passed: skill-creator `quick_validate.py`.
- Passed: `agentskills validate`.
- Passed: JSON, eval structure, Shopify/Forge manifest parity, and `git diff --check`.
- Failed: plugin-creator validation requires expanded Codex interface metadata and rejects both the Forge manifest and the matching Shopify manifest.
- Not run: live Shopify theme and browser verification because no store-backed theme environment was available.

## Relevant artifacts

- Skill: `plugins/shopify/skills/shopify-theme-dev-preview/SKILL.md`
- Evals: `plugins/shopify/skills/shopify-theme-dev-preview/evals/`
- PR: https://github.com/slavafyi/skills/pull/3
