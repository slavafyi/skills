# Diagnosis loop

Use this loop before changing production code.

## 1. Build the feedback loop

A feedback loop is an agent-runnable way to tell whether the bug still exists.

Try, in roughly this order:

1. Existing failing test.
2. New focused test at the nearest correct seam.
3. CLI command with fixture input.
4. HTTP request or API script against a local server.
5. Browser automation or a manual UI script.
6. Replay of a captured payload, log, or trace.
7. Small throwaway harness that exercises the failing path.
8. Repeated stress loop for flaky failures.
9. Performance benchmark or timing harness for regressions.
10. Human-in-the-loop reproduction when no automation is possible.

Spend real effort here. A weak loop makes the rest of the fix unreliable.

## 2. Confirm it is the same bug

Before diagnosing, check:

- the failure matches the user report;
- the reproduction fails before the fix;
- the symptom is captured clearly;
- unrelated failures are not being mistaken for the bug.

## 3. Record the diagnosis before fixing

Before editing production code, write a short diagnosis record:

```text
Observed behavior: ...
Expected behavior: ...
Reproduction path: ...
Suspected root cause: ...
Evidence: ...
Smallest safe fix: ...
Regression check: ...
```

If any required part is unknown, keep diagnosing or stop and explain what is missing. Do not replace a missing root cause with a workaround that only hides the symptom.

## 4. Sharpen the loop

Improve the loop before debugging deeply:

- narrow the input;
- reduce setup;
- assert the exact symptom;
- remove unrelated noise;
- pin time, randomness, filesystem, or network when relevant;
- repeat flaky triggers until the failure rate is useful.

## 5. Hypothesize

Create 3 to 5 ranked hypotheses when the cause is not obvious.

Each hypothesis should say:

```text
If <cause> is true, then <probe> should show <observable result>.
```

Discard hypotheses that cannot be tested.

## 6. Probe one variable at a time

Prefer:

- debugger or REPL inspection;
- targeted logs at boundaries;
- small assertions;
- data or state snapshots;
- bisection when the bug appeared between known versions.

Avoid:

- broad logging with no question;
- editing code while unsure what the probe means;
- changing several variables at once;
- adding special cases because they quiet the symptom.

## 7. Escalate design ambiguity

Stop and return to spec/design discussion when:

- the "bug" is really unspecified behavior;
- multiple outcomes would be reasonable;
- the edge case affects product expectations, data shape, security, or compatibility;
- the fix would contradict the spec or ADR;
- the proposed fix is only a workaround for an unknown deeper issue.

Name the ambiguity and present options. Do not silently choose an edge-case behavior in code, even if the change looks small.

## 8. Remove temporary probes

Tag temporary logs or probes with a unique marker such as:

```text
[DEBUG-forge-<short-id>]
```

Before finishing, search for the marker and remove all temporary instrumentation.
