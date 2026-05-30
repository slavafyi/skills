# Test design checklist

Use this checklist to keep tests focused, readable, deterministic, and useful.

## Before writing

- What behavior should fail if the code breaks?
- What risk is this test reducing?
- What stable public or durable contract can prove it?
- Is this behavior specified, or should it go back to `forge-spec`?
- Is there an existing project convention for this kind of test?
- Which CI tier should own this test?

## Naming and structure

Follow existing project naming conventions first.

If no convention exists, use behavior-oriented names:

- `should_<expected>_when_<condition>`;
- `<subject>_<scenario>_<expected>`;
- `it("returns ... when ...")`;
- Given/When/Then scenario names for acceptance or BDD-style tests.

Prefer Arrange/Act/Assert for small tests and Given/When/Then for acceptance, behavior, or scenario tests. Keep setup readable and local unless a shared fixture is already a project convention.

Use table-driven or parameterized tests when the same behavior should be checked across multiple inputs, boundaries, or negative cases. Follow the project's idiom: Go table tests, `pytest.mark.parametrize`, JUnit `@ParameterizedTest`, xUnit theories, RSpec shared examples, or the local equivalent. Avoid copy-pasting near-identical test bodies.

## Assertions

- Assert observable behavior, not internal steps.
- Assert the smallest set of facts that prove the behavior.
- Include meaningful failure messages when the runner supports them and the assertion would otherwise be unclear.
- Avoid assertions that simply duplicate the implementation.
- Avoid "not null" or "called once" assertions unless they prove the contract.
- For errors, assert the meaningful error type/status/code/message shape, not incidental text unless text is the contract.

## Test data

Prefer:

- minimal but realistic data;
- named fixtures for repeated domain scenarios;
- adversarial/negative-path data for plausible failures;
- deterministic clocks, IDs, and randomness;
- factories/builders that make intent clear.

Avoid:

- giant opaque fixture dumps;
- production data;
- hidden global fixture dependencies;
- random values that are not captured on failure;
- relying on test order.

## Doubles and dependencies

- Use real dependencies when fidelity matters and isolation is safe.
- Use Testcontainers or equivalent infrastructure when dependency behavior matters.
- Use official fakes/emulators when the dependency owner provides them and fidelity is sufficient.
- Use fakes/stubs/mocks only for dependencies outside the behavior under test.
- Do not mock third-party SDKs directly unless the project explicitly accepts that trade-off.
- Do not assert interaction details unless interaction itself is the contract.

## Negative and adversarial tests

Add hostile cases when relevant:

- empty, null, missing, malformed, duplicated, oversized, out-of-order, expired, unauthorized, concurrent, retried, partial, corrupted, slow, timeout, unavailable, and rollback cases;
- boundary values around limits, timestamps, pagination, money, locale, encoding, permissions, and idempotency keys;
- unexpected but valid inputs that production users or integrations may send.

Do not add negative cases mechanically. Each negative test should protect a plausible failure mode.

## Flakiness and determinism

- Prefer hermetic tests.
- Do not use arbitrary sleeps; wait for events, readiness, health, explicit state, or deterministic synchronization.
- Give long-running tests explicit timeouts.
- Control time, randomness, IDs, concurrency, and external state where possible.
- Do not rely on test order.
- Do not call real external services unless the project explicitly classifies the test as live/external and it is safe.
- If a test is flaky, diagnose or quarantine through the project mechanism; do not weaken the assertion or hide the failure.

## Snapshots and golden files

Use snapshots or golden files when they protect a stable external contract or large structured output. Avoid broad snapshots that make harmless changes noisy or lock in accidental formatting.

Prefer inline, focused, or colocated snapshots when the ecosystem supports them and the diff remains reviewable.

When a snapshot changes, report why the change is intentional.

## Coverage and adequacy

Coverage is useful only when paired with behavior intent. Ask:

- What bug would this test catch?
- What contract would this test protect?
- Would this test fail for the reported bug?
- Would this test still pass if the implementation were wrong in a plausible way?
- Is a smaller, faster, more stable test possible?
- Is a broader, higher-fidelity test needed because this code is mostly glue/integration?
