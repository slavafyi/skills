# Stop policy

Stop implementation and reassess when:

- validation fails and the cause is not obvious;
- the fix would require changing unrelated code;
- an edge case is not covered by the spec;
- the implementation needs a product/design decision;
- the implementation needs a durable architecture decision;
- the selected slice no longer matches the plan;
- current Git diff contains unexplained user changes.

Before choosing a fix, write down:

- the observed failure, surprise, or edge case;
- the behavior the current spec/plan implies;
- the evidence for the suspected root cause;
- whether the issue is a bug, missing requirement, unclear edge case, or architecture decision;
- the smallest safe next step.

Route after stopping:

- `forge-fix` for reproducible broken behavior or failed validation that needs diagnosis;
- `forge-spec` for missing requirements, behavior ambiguity, or edge cases;
- `forge-plan` for unclear slicing or implementation order;
- `forge-adr` for durable architectural decisions;
- user question when the repository cannot answer the decision safely.

Do not patch symptoms just to make the immediate error disappear.

## Edge-case ambiguity

When an edge case reveals ambiguous product behavior, data shape, compatibility, security, or architecture expectations, do not solve it locally in code first.

Instead:

1. name the ambiguity;
2. point to the spec, plan, ADR, or missing artifact that should own the decision;
3. present the realistic options and tradeoffs;
4. get a decision from the user or update the open question;
5. update the spec/plan/ADR before continuing implementation.

A code special case is acceptable only after the intended behavior is explicit.

Do not encode a local special case first and document it afterwards.
