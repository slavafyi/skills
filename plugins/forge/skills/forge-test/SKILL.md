---
name: forge-test
description: Design or improve automated tests for a bounded behavior, bug, integration, or implementation slice. Use when test strategy, TDD, regression proof, Testcontainers, contract tests, flakiness, or CI budget matters.
---

# forge-test

Design tests that prove behavior through stable contracts, not accidental implementation details.

## Use when

- The user asks to add tests, improve coverage, create a test plan, use TDD, or choose unit/component/integration/contract/E2E coverage.
- A spec, plan, build, fix, or review needs a clearer automated testing strategy before work can be accepted.
- A bug or issue/PR feedback needs regression proof after reproduction and root-cause diagnosis.
- Existing tests are missing, brittle, flaky, too broad, too slow, over-mocked, or testing the wrong behavior.
- Real dependencies, API contracts, UI behavior, accessibility, visual output, or LLM/agent behavior need compatibility or regression protection.

## Procedure

1. Read the relevant request, active artifacts, current diff, existing tests, CI config, manifests, and project instructions.
2. If the prompt includes an issue or PR URL or shorthand reference, use provider CLI docs/help/output to fetch minimum useful context before normal work; full URLs are authoritative, shorthand requires an unambiguous current Git remote, and blocked or ambiguous access should become a clear ask instead of guessed content.
3. Identify the behavior, risk, and observable contract. If behavior is underspecified, route to `forge-spec` before encoding assumptions.
4. Discover existing project test conventions before adding frameworks, tools, folders, dependencies, or CI lanes. Use `references/platform-discovery.md`.
5. Choose a portfolio, mode, layer, and seam that match the architecture and risk. Do not apply the classic pyramid mechanically. Use `references/testing-strategy.md`.
6. Choose dependency fidelity deliberately: real dependency, Testcontainers, official fake/emulator, fake, stub, mock, or manual fallback. Use `references/test-doubles-and-contracts.md` and `references/testcontainers-policy.md`.
7. Choose the working loop: TDD, regression-first, characterization, property/fuzz, contract, specialized, or ordinary test update. Use the relevant references.
8. Keep tests hermetic, deterministic, readable, and assigned to an appropriate CI tier. Use `references/flakiness-and-determinism.md`, `references/ci-and-coverage-policy.md`, and `references/test-design-checklist.md`.
9. Add or update the smallest meaningful tests, run the smallest useful command first, and report observed validation, missing proof, and follow-up routes. Use `references/test-output-format.md` when detailed output is helpful.

## Constraints

- Do not add new test tools, container dependencies, browser tools, contract tools, eval tools, or heavy infrastructure when existing project conventions are sufficient, unless the user approves.
- Do not write tests that only lock in accidental implementation details, private internals, or current framework wiring.
- Do not mock what you do not own. Prefer real implementations, official fakes/emulators, Testcontainers, or project-owned adapters.
- Do not introduce ports, adapters, dependency injection, interfaces, or indirection solely to satisfy a unit test.
- Do not use arbitrary sleeps, production credentials, production services, shared databases, shared queues, or non-isolated external state.
- Do not silently weaken assertions, delete tests, broaden snapshots, or quarantine failures to make a build green.
- Do not claim coverage, validation, expected failure, or regression proof that was not observed.
- Do not make persistent repository changes on a protected, shared, or mismatched branch without explicit user confirmation or a user-approved branch/worktree.
- Do not write provider comments without explicit user confirmation.

## Output

Keep the response concise. Include only the sections that matter for the task:

- test target: behavior, risk, and source;
- existing conventions: runner, test location, naming style, and CI tier;
- strategy: mode, layer, seam, dependency fidelity, and why;
- tests added or changed;
- validation: passed, failed, and not run;
- coverage of intent: covered, still missing, and follow-up route.

For detailed reports, use `references/test-output-format.md`.

## References

- `references/testing-strategy.md`
- `references/tdd-policy.md`
- `references/test-doubles-and-contracts.md`
- `references/testcontainers-policy.md`
- `references/property-based-testing.md`
- `references/flakiness-and-determinism.md`
- `references/ci-and-coverage-policy.md`
- `references/specialized-testing.md`
- `references/test-design-checklist.md`
- `references/platform-discovery.md`
- `references/test-output-format.md`
