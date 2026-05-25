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

## 3. Sharpen the loop

Improve the loop before debugging deeply:

- narrow the input;
- reduce setup;
- assert the exact symptom;
- remove unrelated noise;
- pin time, randomness, filesystem, or network when relevant;
- repeat flaky triggers until the failure rate is useful.

## 4. Hypothesize

Create 3 to 5 ranked hypotheses when the cause is not obvious.

Each hypothesis should say:

```text
If <cause> is true, then <probe> should show <observable result>.
```

Discard hypotheses that cannot be tested.

## 5. Probe one variable at a time

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

## 6. Escalate design ambiguity

Stop and return to spec/design discussion when:

- the "bug" is really unspecified behavior;
- multiple outcomes would be reasonable;
- the edge case affects product expectations, data shape, security, or compatibility;
- the fix would contradict the spec or ADR;
- the proposed fix is only a workaround for an unknown deeper issue.

Name the ambiguity and present options. Do not silently choose an edge-case behavior in code.

## 7. Remove temporary probes

Tag temporary logs or probes with a unique marker such as:

```text
[DEBUG-forge-<short-id>]
```

Before finishing, search for the marker and remove all temporary instrumentation.
