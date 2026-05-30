# Testing strategy

Use tests as executable evidence. A test is useful when it would fail for the right reason if the intended behavior breaks.

## Core principle

Choose the narrowest stable test layer that proves the behavior through a public or durable contract with enough fidelity for the risk.

Do not choose test layers mechanically. Balance:

- speed: how quickly developers get feedback;
- maintainability: how costly the test is to understand and update;
- utilization: CPU, memory, I/O, Docker, network, and CI cost;
- reliability: whether failures mean real problems rather than flakiness;
- fidelity: how closely the test environment matches production-relevant behavior.

## Portfolio, not pyramid dogma

The classic test pyramid is a useful warning against too many slow, brittle broad-stack tests. It is not a universal shape.

Match the test portfolio to the architecture:

- Domain-heavy or algorithm-heavy code: many small/unit tests are usually high ROI.
- Service, glue, framework, or infrastructure-heavy code: component and integration tests often catch the real risks better than over-mocked unit tests.
- Distributed systems: contract tests and realistic integration tests may be more important than isolated unit tests.
- UI-heavy systems: component/user-flow tests, accessibility checks, and visual regression may matter more than private component internals.
- LLM or agentic behavior: evals, golden datasets, prompt/model regression tests, and scenario traces may be the only meaningful proof.
- Legacy systems: characterization tests may come before redesign or TDD.

Prefer a balanced portfolio that minimizes duplicate proof. If a higher-level test is fast, reliable, and cheap to maintain, a lower-level duplicate is not always needed. If a high-level test is slow, flaky, or hard to diagnose, add a smaller regression test at the root-cause seam when possible.

## Layer selection

| Layer | Use for | Avoid when | Evidence quality |
| --- | --- | --- | --- |
| Small / unit | Pure logic, parsing, formatting, validation rules, state machines, domain policies, deterministic adapters with fakes | Behavior depends on real database, filesystem, network, browser, framework wiring, deployment config, or concurrency | Fast, focused, low-fidelity |
| Component / module | A cohesive module through its public boundary with realistic local wiring | It requires many mocked internals or reimplements production wiring | Good design feedback with moderate fidelity |
| Integration | Real database, queue, cache, object storage, filesystem, repository layer, API handler, service wiring, serialization, migrations | Pure algorithms or UI-only behavior | Higher fidelity; often best with Testcontainers |
| Contract | Consumer/provider API, event payloads, CLI output, SDK behavior, webhook/message compatibility, schema compatibility | There is no independent consumer/provider or compatibility boundary | Protects compatibility without full E2E cost |
| E2E / broad-stack | Critical user journeys, browser behavior, deployment/config wiring, cross-service flows | A smaller layer can prove the same behavior reliably | Highest fidelity, highest cost and flakiness risk |
| Regression | A known bug has a reproducible symptom and a stable seam | The bug is not understood or behavior is unspecified | Keeps the exact bug dead |
| Characterization | Legacy code behavior must be captured before safe refactoring | The current behavior is known to be wrong and should not be preserved | Documents existing behavior before change |
| Property / fuzz | Parsers, serializers, encoders, validators, numeric logic, state machines, security boundaries | Expected properties are unclear or hard to check | Finds unanticipated inputs |
| Mutation | Test quality is suspect and you need evidence that tests catch code changes | The suite is already too slow or unstable | Detects weak assertions |
| Performance / load | Latency, throughput, concurrency, memory, lock contention, startup time | The behavior is functional only | Requires careful budgets and stable environments |
| Security | Authorization, injection, escaping, secrets, SSRF, path traversal, deserialization, dependency risk | The test cannot be automated safely | Protects abuse cases and negative paths |
| Specialized | LLM evals, accessibility, visual regression, schema compatibility, mobile/device quirks | Project has no relevant surface | Protects domain-specific risks |

## Test portfolio rules

- Start from the risk, not from the preferred test shape.
- Prefer tests that fail close to the cause and explain the failure well.
- Add broader tests for risks small tests cannot see: real dependency behavior, configuration, migrations, concurrency, browser/runtime behavior, contract compatibility, and deployment wiring.
- For service/glue-heavy code, do not over-invest in mocked unit tests that only prove the mocks.
- For pure domain logic, do not force heavy integration tests when small deterministic tests prove the behavior.
- If a high-level test finds a bug, add the narrowest lower-level regression test that catches the same root cause when a stable seam exists.
- Avoid duplicate tests that prove the same behavior at many layers unless the duplication protects different risks.
- Treat code coverage as a signal, not a goal. A covered line is not necessarily a proven behavior.

## Test intent taxonomy

When designing a test, name the intent before coding:

- happy path;
- boundary value;
- invalid input;
- missing dependency;
- concurrency/race;
- idempotency;
- ordering;
- retry/backoff;
- serialization/deserialization;
- backward compatibility;
- authorization/authentication;
- data migration;
- failure recovery;
- performance budget;
- security abuse case;
- accessibility behavior;
- visual/layout contract;
- LLM/prompt/model regression.

Good tests often include adversarial or negative-path inputs: inconvenient, irregular, boundary-heavy, or hostile cases that expose weak assumptions. If the project uses the phrase "angry tests", treat it as a synonym for adversarial/negative-path tests.
