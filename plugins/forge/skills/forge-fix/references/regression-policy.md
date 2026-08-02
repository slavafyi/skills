# Regression proof

Regression proof should fail for the reported behavior before the fix and pass
after it.

Prefer:

- a focused test through a stable public seam;
- API or CLI behavior for contract failures;
- fixture replay for parsers, imports, webhooks, or sync;
- a stress loop for timing or concurrency defects;
- a UI test only when the defect is genuinely UI behavior.

Avoid tests that mirror the implementation, broad snapshots, or checks that
would pass while the original bug remains.

Do not introduce a new framework, dependency, adapter, or abstraction solely to
obtain one regression test. If no stable seam exists, record the runtime or
manual proof used and the remaining gap.
