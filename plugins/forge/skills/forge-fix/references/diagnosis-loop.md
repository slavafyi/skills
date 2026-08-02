# Diagnosis loop

## Build a feedback signal

Prefer the cheapest signal that reproduces the reported behavior:

1. existing failing test or validation command;
2. focused test at a stable public seam;
3. CLI command, API request, or fixture replay;
4. browser or runtime reproduction;
5. temporary harness, repeated stress loop, benchmark, log, or trace.

A manual reproduction is acceptable when automation is impractical. Record what
was observed and what remains unproved.

## Confirm the same failure

Check that the signal:

- fails before the fix;
- matches the user's symptom rather than an unrelated failure;
- asserts the meaningful behavior, not incidental implementation details;
- is narrow enough to rerun quickly.

## Trace the real path

Before editing the apparent failure site:

- search every caller of the function or boundary involved;
- inspect shared validation, normalization, persistence, and error paths;
- compare working sibling paths;
- use Git history or blame when the regression timing matters.

A single fix in the shared path is preferable to guards in every caller.

## Test hypotheses

When the cause is not obvious, rank a few falsifiable hypotheses. For each one,
state what a probe should show if it is true, then vary one thing at a time.
Prefer debugger inspection, targeted logs, assertions, state snapshots, and
bisection over broad speculative edits.

Before changing production code, write a short diagnosis:

```text
Observed: ...
Expected: ...
Evidence: ...
Root cause: ...
Smallest safe fix: ...
Regression signal: ...
```

## Handle ambiguity without stalling

Ask the user only when choosing an outcome would materially change product
behavior, stored data, security, compatibility, or a public contract. For a
local and reversible detail, follow existing conventions and report the
assumption.

## Clean up and verify

Mark temporary probes with a unique token, remove them before finishing, rerun
the original signal, and then run the nearest broader validation justified by
the changed surface.
