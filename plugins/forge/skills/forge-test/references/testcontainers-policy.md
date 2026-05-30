# Testcontainers policy

Use Testcontainers, or an equivalent isolated container-based test environment, when the behavior depends on real infrastructure and an in-memory substitute or mock would hide important risk.

## Good fits

- Database behavior: SQL dialect, constraints, transactions, migrations, indexes, JSON columns, locking, connection pooling.
- Message brokers and streams: delivery, ordering, retries, dead letters, serialization, consumer groups.
- Caches and stores: Redis/Memcached behavior, TTLs, eviction, atomic operations.
- Object storage and cloud-like APIs when a local emulator is available.
- Search engines, browsers, HTTP services, SMTP servers, SFTP servers, or other containerized dependencies.
- Application integration tests that need production-like wiring without a shared environment.

## Poor fits

- Pure algorithmic logic.
- Tests where a simple fake accurately represents the dependency contract.
- Tests that can be made small and deterministic without infrastructure.
- Full-stack scenarios where a contract or integration test would cover the risk more cheaply.
- Environments where Docker or an equivalent container runtime is unavailable and the project has no CI path for it.

## Discovery before adding

Before adding Testcontainers:

1. Check whether the project already uses Testcontainers, Docker Compose, local emulators, fixtures, or integration-test harnesses.
2. Check the language ecosystem and existing test runner.
3. Prefer the official Testcontainers library/module for the project language when available.
4. Prefer project-standard package managers and dependency locations.
5. Ask before adding new infrastructure dependencies if project conventions are unclear.

## Cross-platform rules

- Pin container images to explicit versions when reproducibility matters.
- Use random host ports and retrieve mapped ports from the Testcontainers API.
- Avoid static container, network, and volume names.
- Use readiness/wait strategies that prove the service is ready, not just that the process started.
- Retrieve the container host from the library/runtime instead of assuming `localhost` in CI.
- Use migrations and seeds intentionally; keep them local to the test environment.
- Avoid mounting arbitrary host paths unless the project convention requires it.
- Do not disable resource cleanup/reapers unless the project has an explicit reason.
- Do not use production credentials, production networks, shared databases, shared queues, or shared object stores.
- Make CI requirements explicit: Docker daemon, remote Docker, permissions, image pulls, cache, and platform architecture.

## Database isolation lanes

Pick and report a lane. Do not merely say "isolated state".

| Lane | Use when | Trade-offs |
| --- | --- | --- |
| Transaction rollback per test | The application and test can share a transaction boundary, no committed async work is required, and the framework supports it cleanly | Fast; may hide commit/transaction behavior and often breaks across async, queues, multiple connections, or external processes |
| Truncate/reset between tests | Tests need committed data and a shared database/container is faster than per-test databases | Simple; slower than transactions; can be hard with FK constraints; parallel workers need separate schemas/databases or locks |
| Schema/database per worker | Parallel tests need independence while reusing a shared database server/container | Good balance; requires naming, migration, and cleanup discipline |
| Container per suite/class | Startup cost is acceptable and the dependency state should be shared within a bounded suite | Good fidelity; requires explicit reset strategy inside the suite |
| Container per test | Maximum isolation is needed for destructive behavior or dependency-level configuration | Very slow; use only for high-risk cases or when containers are cheap |

Prefer schema/database per worker or reset-between-tests for most containerized database suites. Prefer transaction rollback for fast repository tests only when it proves the real behavior. Use container per test only when the test changes database-level state that cannot be reset safely.

## Migrations and seed data

- Run the same migrations that production uses when migration compatibility is part of the risk.
- Use minimal seed data that belongs to the test, not a shared global fixture that many tests silently depend on.
- Prefer factory/builders or small named fixtures over large opaque dumps.
- Keep seed data deterministic.
- Clean up state by the chosen isolation lane, not by ad hoc deletes inside assertions.

## Performance and tiering

- Keep Testcontainers tests out of the fastest unit-only lane unless the project already treats them as fast.
- Prefer targeted integration commands locally and in PR checks.
- Move broad, expensive, or flaky container suites to scheduled/nightly/release tiers only when they cannot be made reliable enough for PR.
- Report Docker requirements and expected runtime when adding the first containerized suite.

## Fallbacks

If Testcontainers is not available:

- do not silently replace it with a low-fidelity mock and claim equivalent proof;
- report the missing runtime requirement;
- use the project-approved local emulator or fixture path if one exists;
- otherwise mark the integration proof as not run and route to the user or CI.
