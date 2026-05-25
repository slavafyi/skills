# Regression policy

Regression proof should show that the specific bug would fail before the fix and pass after it.

## Prefer

- focused unit/integration test at the nearest stable seam;
- API or CLI test through the public contract;
- UI test only when the bug is genuinely UI behavior;
- fixture replay for parser, importer, webhook, or sync bugs;
- stress loop for flaky concurrency/timing bugs.

## Avoid

- tests that assert implementation details unrelated to the bug;
- snapshots that hide the important behavior;
- broad tests that pass even when the bug remains;
- changing production code only to make testing easier unless the seam is a real design improvement.

## When no good regression test exists

Record:

- why a test was not practical;
- what manual or runtime check was used;
- what design/testing seam would make future proof better.

If the missing seam reveals a durable architecture issue, consider `forge-adr` after the fix is understood.
