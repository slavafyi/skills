# Review checklist

Review in priority order.

## 1. Scope and intent

- Does the diff match the user request?
- Does it match the active spec and plan?
- Are non-goals respected?
- Are unrelated changes mixed in?
- Are untracked files relevant?

## 2. Correctness

- Does the implementation satisfy the acceptance criteria?
- Are edge cases handled according to the spec?
- Are there new failure modes, race conditions, or data consistency issues?
- Does error handling match project conventions?
- Are migrations, API changes, and compatibility handled safely?

## 3. Root cause and design integrity

Flag as blocking when:

- a change patches a symptom without explaining the root cause;
- an edge case behavior was invented in code but not specified;
- the diff works around a failing test instead of fixing the cause;
- the implementation contradicts a spec, plan, ADR, or local skill;
- a hidden architecture decision was made without an ADR or user decision.

Route these to `forge-fix`, `forge-spec`, or `forge-adr` instead of treating them as minor comments.

## 4. Tests and validation

- Is the important behavior tested through a stable interface?
- Are regressions covered?
- Were the right commands run?
- Are skipped checks explained?
- Did validation fail and get diagnosed rather than ignored?

## 5. Maintainability

- Is the diff as small as the task allows?
- Does it follow existing patterns?
- Are abstractions justified by current pressure?
- Is naming consistent with project vocabulary?
- Are comments useful and not noisy?

## 6. Security, privacy, and reliability

Check when relevant:

- secrets or tokens leaked;
- unsafe shell, SQL, eval, or path handling;
- authentication and authorization changes;
- sensitive data handling;
- logging of private data;
- retry, timeout, cancellation, and resource cleanup;
- backwards compatibility.

## 7. Documentation and handoff

- Does `docs/status.md` need an update?
- Does the plan need its slice marked?
- Is the spec stale?
- Is an ADR needed?
- Is the next action clear?

## Finding quality

A good finding includes path, issue, impact, and a concrete fix direction.

Avoid vague comments like:

- "This seems wrong."
- "Maybe refactor."
- "Consider improving this."
