# TDD policy

Use TDD as a design technique, not as ceremony. Prefer test-first work when it clarifies the interface and provides quick feedback.

## Use TDD when

- The desired behavior is clear enough to encode as a failing test.
- There is a stable public seam or one can be introduced without overdesign.
- The test can run quickly enough to guide development.
- The change benefits from interface-first thinking.
- A bug has been reproduced and a regression test can fail for the same reason before the fix.

## Avoid forcing TDD when

- Requirements or intended behavior are unclear. Route to `forge-spec` first.
- You are doing a short exploratory spike to discover feasibility.
- The only available test path is slow, flaky, or broad-stack and no smaller seam exists yet.
- The code is legacy and behavior must first be characterized before it can be safely changed.
- The test would only mirror the implementation rather than assert a contract.
- TDD pressure would introduce indirection, dependency injection, interfaces, ports, adapters, or framework abstraction solely to make a unit test easy.

## Agent TDD loop

1. Write a short test list before coding.
2. Pick the next small behavior from the list.
3. Write the failing test first, or explain why that is impossible.
4. Run the narrowest command that should show the failure.
5. Confirm the failure is for the intended reason, not a setup error.
6. Implement only enough production code to pass the test.
7. Run the same test again.
8. Refactor test and production code while keeping tests green.
9. Run nearby relevant tests when the local test passes.
10. Update the test list and stop when the accepted behavior is covered.

## Regression-first bug fixes

For bugs, do not start with the fix when a stable regression seam exists.

1. Reproduce the bug or inspect an existing failure.
2. Identify the smallest behavior that should fail before the fix.
3. Add or adjust a test that fails for the reported symptom/root cause.
4. Confirm the test fails for the right reason.
5. Fix the root cause.
6. Confirm the regression test passes.
7. Run broader validation relevant to the touched area.

## Characterization before refactor

For legacy or poorly understood code, write characterization tests around externally observable behavior before refactoring. Mark captured behavior as intentional only when the spec or user confirms it.

## Test-induced design damage guardrails

Do not distort production design solely for test convenience. Testability is useful design feedback, but it is not the only design goal.

Prefer:

- testing through an existing public contract;
- introducing an owned adapter only when it also improves production clarity, portability, or dependency control;
- using a higher-fidelity component/integration test when a unit test would require fake abstractions;
- refactoring toward simpler production code, not toward a forest of test-only indirection.

Avoid:

- adding interfaces with one production implementation only because a mock framework wants them;
- making private helpers public only for tests;
- passing clocks, IDs, clients, or repositories through many layers unless the design benefit is real;
- replacing clear framework code with custom wrappers that only help tests.

## TDD anti-patterns for agents

- Writing tests after implementation and shaping them to the new code.
- Skipping the failing state but claiming TDD was used.
- Mocking the function or module that should be proven.
- Testing private helper behavior instead of the public contract.
- Adding broad snapshots that make future changes noisy.
- Weakening assertions when the test reveals a design or requirement issue.
