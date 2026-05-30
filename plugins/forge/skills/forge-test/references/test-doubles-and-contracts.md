# Test doubles and contract testing

Use test doubles deliberately. The purpose is not to make tests isolated at any cost; it is to control irrelevant collaborators while still proving the behavior that matters.

## Vocabulary

Use this vocabulary when reporting or reviewing tests:

| Term | Meaning | Typical use |
| --- | --- | --- |
| Dummy | Passed only to satisfy an interface; not used by the test path | Required argument that should never be called |
| Stub | Returns canned answers | Control indirect input |
| Spy | Records calls for later inspection | Verify an observable interaction when interaction is the contract |
| Mock | Pre-programmed expectation about interactions | Protocol/interaction behavior, used sparingly |
| Fake | Working simplified implementation | In-memory repository, fake clock, local queue, official emulator |
| Real dependency | Actual implementation or service | When fidelity matters and isolation is safe |

Do not use "mock" as a generic word for every test double in durable documentation. Say what kind of double is being used and why.

## Mock what you own

Prefer not to mock third-party SDKs, framework internals, generated clients, database drivers, HTTP libraries, or cloud clients directly.

Instead, choose one of these paths:

1. Use the real implementation in an isolated test when safe and fast enough.
2. Use an official fake, emulator, simulator, or Testcontainers-backed dependency.
3. Wrap the third-party dependency behind a project-owned adapter when that adapter improves production design.
4. Mock or fake the project-owned adapter, not the third-party type.
5. Add contract tests to prove the adapter still matches the real provider behavior.

Do not create adapters solely to satisfy a unit test. If the wrapper would not improve production clarity, portability, or dependency control, prefer a component or integration test.

## What not to mock

Do not mock:

- the behavior under test;
- private implementation details;
- data transformations that are the actual behavior;
- third-party APIs whose quirks matter;
- persistence/transaction behavior when the bug depends on the real database;
- serialization/deserialization when compatibility matters;
- clock/RNG/ID generation by monkey-patching global state when an explicit seam exists or can be cleanly added.

## Interaction assertions

Use interaction assertions only when the interaction is part of the observable contract:

- an event must be emitted;
- a retry/backoff policy must call a collaborator a specific number of times;
- a command must not call an external side effect under a guard condition;
- an audit log, metric, notification, or queue message is required behavior.

Avoid call-order and call-count assertions when final state or returned output proves the behavior more clearly.

## Contract testing

Use contract tests when two independently evolving parties must remain compatible:

- service consumer/provider HTTP APIs;
- message/event payloads;
- webhooks;
- CLI output consumed by scripts;
- SDK behavior;
- OpenAPI, GraphQL, gRPC, or schema-governed boundaries.

Consumer-driven contract testing is useful when consumers define the interactions they rely on and providers verify that they still satisfy them. Tools may include Pact/PactFlow, Spring Cloud Contract, project-specific contract fixtures, or equivalent ecosystem tools.

Schema-driven contract and API tests are useful when an OpenAPI, GraphQL, AsyncAPI, gRPC, protobuf, or similar schema is the durable boundary. Tools may include Schemathesis for schema-driven/property-based API testing, Prism or similar mock/proxy servers for OpenAPI-based stubs, generated schema validators, or project-specific compatibility checks.

Bidirectional contract testing can be useful when both consumer expectations and provider schemas/examples are available and the team wants compatibility checks without a full CDC workflow. Treat it as complementary to consumer-driven contracts, not a replacement when provider state and consumer examples matter.

Schema tests are useful but are not always enough. A schema may prove shape while missing examples, error semantics, optional fields, ordering, pagination, authentication behavior, or provider state. Pair schema compatibility with examples or consumer expectations when those details matter.

## Contract + mock pairing

If a consumer test uses a mock provider or stub server, make sure the expectation is backed by a durable contract artifact or provider verification path.

Report:

- where the contract lives;
- how the consumer generates or checks it;
- how the provider verifies it;
- whether CI enforces compatibility;
- what remains manual or unverified.
