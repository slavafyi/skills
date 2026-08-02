# ADR criteria

Without an explicit user request, create an ADR only when all of these are
true:

1. The decision affects architecture, data, a public API, security, deployment,
   operations, or another cross-cutting project boundary.
2. At least two realistic alternatives have materially different trade-offs.
3. Reversal would require significant migration, coordination, compatibility
   work, or discarded implementation effort.
4. The rationale is not obvious or reliably enforced by the resulting code,
   tests, configuration, or tooling.

Honor a direct user request to create an ADR. If the choice is local or easily
reversible, keep the record concise and say so rather than inflating its
architectural importance.

Do not create an ADR for:

- product behavior or acceptance criteria;
- naming and style preferences;
- routine dependency or framework usage;
- lint rules already explained by configuration;
- one-off implementation details or temporary workarounds;
- decisions that are still unresolved.

Use these statuses:

- `proposed`: documented but not selected;
- `accepted`: selected and currently applicable;
- `superseded`: replaced by a newer ADR;
- `deprecated`: no longer recommended without a direct replacement.
