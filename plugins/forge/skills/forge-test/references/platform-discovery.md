# Platform discovery

Forge test work must be harness-agnostic and platform-neutral. Discover the project's test stack before adding commands, files, or dependencies.

## Discovery order

1. Read repository instructions: `AGENTS.md`, `CLAUDE.md`, README, contributing docs, project-local skills, and `docs/status.md`.
2. Inspect CI workflows and build scripts.
3. Inspect manifests and lockfiles.
4. Inspect existing test directories, naming conventions, fixtures, helpers, tags, and test tiers.
5. Inspect existing doubles, fakes, emulators, Docker Compose files, Testcontainers usage, contract tests, browser tests, and evals.
6. Prefer the smallest existing command that runs the target tests.
7. If no convention exists, propose a minimal convention before adding it.

## Dependency rule

Do not add a new runner, assertion library, property-testing library, browser tool, contract tool, eval tool, or Testcontainers package until you have checked whether the project already has a standard path.

When adding a dependency is justified, report:

- why existing tools are insufficient;
- which ecosystem-native package is being added;
- whether it affects production or test-only dependencies;
- whether CI needs updates;
- how to run the new tests;
- what tier owns the new tests.

## Command reporting

Always report exact commands and scope:

```md
Validation:
- Passed: `...` (targeted unit test)
- Passed: `...` (integration test with real PostgreSQL via Testcontainers)
- Not run: `...` because ...
```
