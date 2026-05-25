# Planning checklist

Use this checklist before creating or updating an implementation plan.

## Spec readiness

The spec should have:

- clear goal;
- scope and non-goals;
- testable acceptance criteria;
- important edge cases specified or marked open;
- linked ADRs when architecture is constrained;
- validation expectations.

If these are missing, stop and route to `forge-spec`.

## Root-cause and edge-case rule

Planning must not hide design uncertainty.

Stop and return to spec/design discussion when:

- an edge case changes expected behavior;
- the plan needs a product decision not present in the spec;
- the plan needs an architecture decision that should be an ADR;
- an existing failure is being worked around instead of explained;
- the only proposed slice is a symptom patch.

In the plan, record unresolved issues as blockers or risks. Do not convert them into implementation tasks unless the user/spec already chose the behavior.

## Slice quality

Prefer vertical slices that produce real feedback:

- one behavior and its validation;
- one UI flow wired through the real path;
- one API path with request/response behavior;
- one refactor step with unchanged behavior and regression checks.

Avoid horizontal slices such as:

- create all types;
- create all UI;
- create all API;
- write all tests at the end.

Use horizontal foundation work only when the project genuinely cannot produce a verified behavior first.

## Each slice should name

- outcome;
- acceptance criteria covered;
- likely files or modules;
- validation command or check;
- dependencies;
- risks;
- stop conditions;
- status.
