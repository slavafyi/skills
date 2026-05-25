# Stop policy

Stop implementation and reassess when:

- validation fails and the cause is not obvious;
- the fix would require changing unrelated code;
- an edge case is not covered by the spec;
- the implementation needs a product/design decision;
- the implementation needs a durable architecture decision;
- the selected slice no longer matches the plan;
- current Git diff contains unexplained user changes.

Route after stopping:

- `forge-fix` for reproducible broken behavior or failed validation that needs diagnosis;
- `forge-spec` for missing requirements, behavior ambiguity, or edge cases;
- `forge-plan` for unclear slicing or implementation order;
- `forge-adr` for durable architectural decisions;
- user question when the repository cannot answer the decision safely.

Do not patch symptoms just to make the immediate error disappear.
