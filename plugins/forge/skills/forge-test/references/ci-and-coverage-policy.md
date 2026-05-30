# CI and coverage policy

Fit tests into the project's feedback budget. A good test that nobody runs is weak evidence.

## CI tiering

Discover existing CI tiers before adding new ones. Common tiers:

| Tier | Purpose | Typical contents |
| --- | --- | --- |
| Local targeted | Fast feedback during editing | One test file/case, focused package/module command |
| Commit/pre-push | Developer confidence before sharing | Nearby unit/component tests, formatting, typecheck/lint if cheap |
| PR/blocking | Merge safety | Deterministic tests for touched areas, critical integration/contract tests, required static checks |
| Nightly/scheduled | Broader confidence | Slow integration, broad E2E, extended property/fuzz, mutation, load/perf smoke |
| Release/deploy | Shipping safety | Migration checks, compatibility, smoke, canary, deployment config, critical journeys |
| Live/external | External dependency monitoring | Explicitly marked tests against real services or production-like environments |

When adding tests, report where they should run. Do not silently put slow, Docker-heavy, browser-heavy, or flaky tests into the fastest PR lane.

## Budget rules

- Prefer the smallest command that proves the change while editing.
- Keep PR tests deterministic and bounded.
- If a new test materially increases PR runtime, explain why it belongs there or propose another tier.
- If the project has budgets, obey them.
- If no budget exists, avoid inventing hard numbers; report expected cost qualitatively and propose a tier.
- Avoid duplicating expensive proof in multiple tiers unless the risk justifies it.

## Coverage guidance

Coverage is a map of executed code, not proof of correctness.

Use coverage to find blind spots, not to chase 100%.

Prefer:

- branch/condition coverage over line coverage for decision-heavy code;
- critical-path coverage over global vanity thresholds;
- changed-code coverage when the project uses it;
- mutation testing for critical modules when the ecosystem supports it and runtime is acceptable;
- explicit regression tests for bugs even when coverage is already high.

Avoid:

- raising global thresholds without understanding suite quality;
- adding tests that execute lines without meaningful assertions;
- excluding code from coverage to hide untested risk;
- treating generated code, framework glue, or unreachable defensive branches the same as critical business logic.

## Mutation testing

Use mutation testing when test adequacy is suspect and the code is important enough to justify the cost.

Common ecosystem examples include Stryker / StrykerJS, Stryker.NET, Stryker4s, PIT / PITest for JVM projects, mutmut or Cosmic Ray for Python, cargo-mutants for Rust, and Go mutation tools when the project already uses or accepts them. Treat these as discovery hints, not required dependencies.

Good fits:

- critical authorization, billing, policy, parsing, serialization, and safety logic;
- modules with high line coverage but weak assertions;
- libraries with stable APIs.

Poor fits:

- very slow suites;
- broad integration-only suites;
- generated code;
- volatile UI snapshots;
- code where equivalent mutants create too much noise.

## Reporting

When adding or changing tests, report:

- targeted command used while editing;
- broader command that should run before merge;
- CI tier recommendation;
- expected runtime or cost if notable;
- coverage/mutation evidence if observed;
- gaps that remain.
