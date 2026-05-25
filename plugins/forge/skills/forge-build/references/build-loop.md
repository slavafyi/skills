# Build loop

Use this loop for one implementation slice.

## 1. Pick one target

Priority order:

1. User-named task or slice.
2. First pending item in the active plan.
3. Next unchecked acceptance criterion in the active spec.
4. Small obvious code change requested directly by the user.

Do not pick a target from vibes. If the target is ambiguous, ask one short question or route to `forge-plan`.

## 2. Map the surface area

Before editing, identify:

- likely files or modules;
- existing tests or examples;
- validation command;
- local skills that apply;
- ADRs that constrain the change;
- current uncommitted changes.

## 3. Use vertical slices

A good slice changes enough layers to prove one behavior.

Prefer:

- one behavior and one focused validation;
- one UI interaction wired through the real path;
- one API path with request/response behavior;
- one refactor step with behavior unchanged and tests passing.

Avoid:

- all types first;
- all data structures first;
- all UI first with no real path;
- all tests at the end;
- broad cleanup mixed into feature work.

## 4. Test-first when practical

For new behavior or bug-prevention behavior:

1. write or identify the focused failing check;
2. make the smallest change that passes it;
3. refactor only after the check is green;
4. re-run validation.

If test-first is not practical, explain why and use the best available feedback signal.

## 5. Keep the diff reviewable

- Keep unrelated edits out.
- Avoid formatting churn unless formatters are part of validation.
- Delete temporary debug code.
- Prefer existing patterns unless the spec or ADR calls for a new one.
- Preserve unrelated user changes.

## 6. Finish the slice

A slice is done only when:

- the targeted behavior is implemented;
- validation was run or a concrete reason is recorded;
- plan/status state is updated when the continuation point changed;
- the next action is clear.
