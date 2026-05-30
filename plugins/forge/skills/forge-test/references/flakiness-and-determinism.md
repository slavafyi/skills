# Flakiness and determinism

A flaky test produces inconsistent results for the same code. Flaky tests destroy trust in the suite, slow delivery, and can hide real bugs.

## Hermetic tests

Prefer hermetic tests: tests that contain or control everything they need to run and do not depend on shared external state.

Hermetic tests avoid:

- production or shared staging services;
- shared databases, queues, caches, buckets, and filesystems;
- wall-clock assumptions;
- uncontrolled randomness;
- test order dependencies;
- local machine configuration;
- arbitrary sleeps;
- live network calls unless the test is explicitly classified as live/external.

## Deterministic seams

Make nondeterminism explicit and controllable:

- Time: inject a clock, use a fake clock, or pass timestamps explicitly when the design supports it.
- Randomness: inject RNG, use deterministic seeds, or pass generated values explicitly.
- IDs: use deterministic ID/UUID factories in tests when ID value affects assertions.
- Concurrency: synchronize on events, latches, channels, queues, or observed state, not sleeps.
- Retries/backoff: use controllable timers or short deterministic policies in tests.
- External state: use isolated containers, fakes, fixtures, or emulators.

Do not introduce invasive dependency injection only for tests. If explicit seams would damage production design, prefer a higher-level test or project-approved test utility.

## Waiting rules

Never use arbitrary sleeps as proof of readiness.

Prefer:

- service health/readiness probes;
- container wait strategies;
- event emission;
- polling an explicit state with timeout;
- framework-provided async utilities;
- deterministic fake timers;
- joining worker tasks or draining queues.

Every wait must have a timeout and a useful failure message.

## Flaky-test response

When a test appears flaky:

1. Re-run only enough to confirm nondeterminism.
2. Capture the failure signature, seed, environment, and frequency when possible.
3. Look for common causes: time, randomness, order, concurrency, shared state, external service, async readiness, resource limits, browser rendering, network, or infrastructure.
4. Fix the root cause when feasible.
5. If the test blocks delivery and cannot be fixed immediately, quarantine only through the project-approved mechanism. If no mechanism exists, do not invent one silently; report the flake, evidence, and recommended next step to the user or maintainer.

## Quarantine policy

Quarantine is a temporary safety valve, not a way to make builds green.

Only quarantine when:

- the test is proven flaky or infrastructure-dependent;
- the product behavior is not known to be broken;
- there is a tracking issue, owner, and expiry/review date;
- the quarantined lane still runs somewhere visible;
- the merge/blocking policy is explicit.

Do not:

- delete a flaky test without replacing its coverage;
- weaken assertions to hide nondeterminism;
- move failures to a non-blocking lane without reporting risk;
- quarantine a real product bug.
- create a new quarantine lane, tag, skip marker, or CI exception without project approval.
