# Property-based testing

Use property-based testing when examples are too narrow and the behavior can be described as an invariant over many inputs.

## Good fits

- Parsers, serializers, encoders, decoders, formatters.
- Round-trip behavior: `decode(encode(x)) == x` within a documented domain.
- Validators, normalizers, sanitizers, escaping.
- State machines and protocols.
- Sorting, pagination, idempotency, deduplication, merging.
- Permission and policy boundaries.
- Numeric, date/time, locale, money, timezone, and boundary-heavy logic.
- Security-sensitive input handling.
- API schema fuzzing when an OpenAPI/GraphQL schema exists.

## Poor fits

- Behavior with unclear invariants.
- Tests where generated data mostly violates preconditions and gets discarded.
- Slow integration paths with expensive setup per generated case.
- Snapshot-heavy UI output where meaningful properties are not defined.
- Cases where a few explicit examples would explain behavior more clearly.

## Property test anatomy

A useful property test usually has:

1. A named invariant.
2. Generators that produce valid and meaningful inputs.
3. Constraints/preconditions kept as small as possible.
4. An oracle: a simple expected relation, reference implementation, round-trip, monotonicity rule, idempotency rule, or safety guarantee.
5. Shrinking support so failures reduce to a small counterexample.
6. Reproducibility: seed or replay information in failure output.

## Common properties

- Round trip: encoding then decoding returns equivalent data.
- Idempotence: applying an operation twice equals applying it once.
- Commutativity: order does not matter when the domain says it should not.
- Associativity: grouping does not matter when the domain says it should not.
- Monotonicity: increasing input cannot decrease output, or vice versa.
- Invariants: output always satisfies a rule, regardless of input shape.
- Metamorphic relation: related inputs produce related outputs.
- No crash / no panic: invalid inputs fail safely with documented errors.
- Authorization safety: generated unauthorized cases never gain access.

## Agent rules

- Start with one or two high-value properties, not a giant generated suite.
- Prefer the project's existing property or fuzz testing tool when present.
- Do not add a property-testing library without checking project conventions and asking when dependency policy is unclear.
- Keep generated cases fast and hermetic.
- Avoid over-filtering generated values; design better generators instead.
- Record the seed/counterexample when a failure appears.
- Convert important shrunk counterexamples into explicit regression examples when they explain a real bug.
- Do not hide a property failure by shrinking the generator domain unless the excluded domain is explicitly out of scope.
- Pair property tests with a few readable example tests that document normal behavior.
