# Review checklist

Review in this order and skip sections that do not apply.

## Scope and intent

- Does the change match the request, issue, or acceptance criteria?
- Are unrelated edits or generated artifacts mixed in?
- Are important requested paths or failure modes missing?

## Correctness

- Does the behavior work through the real call path?
- Are boundaries, empty states, invalid inputs, and errors handled correctly?
- Are there race conditions, stale state, data consistency, or cleanup problems?
- Are API, schema, migration, and compatibility changes safe?
- Is a symptom patched while a shared root cause remains?

## Tests and validation

- Is the important behavior proven through a stable interface?
- Would the test fail for a plausible regression?
- Are real dependencies used where their behavior matters?
- Are skipped or failed checks visible and explained?
- Does the claimed validation match direct evidence?

## Security and reliability

Check when relevant:

- authentication and authorization;
- secrets and sensitive data;
- unsafe shell, SQL, path, template, or deserialization handling;
- retry, timeout, cancellation, idempotency, and resource cleanup;
- destructive operations and rollback behavior.

## Maintainability

- Is the diff no larger than the task requires?
- Does it use existing project patterns and platform features?
- Are new dependencies or abstractions justified by current pressure?
- Are comments and names accurate rather than compensating for unclear code?

## Finding bar

A finding must identify a concrete defect or material risk, explain impact, and
suggest a feasible correction. Do not report speculative taste preferences as
bugs.
