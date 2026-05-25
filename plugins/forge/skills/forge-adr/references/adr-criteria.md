# ADR criteria

Create an ADR only when the decision is important enough to survive future sessions.

## Create an ADR when most are true

- The decision is hard or costly to reverse.
- The decision affects architecture, data, API, security, deployment, operations, or long-term developer experience.
- There were meaningful alternatives.
- The tradeoff is not obvious from the final code.
- Future agents or maintainers may otherwise undo it.
- The decision changes how future specs, plans, or builds should be done.

## Usually do not create an ADR for

- local style preferences;
- naming choices;
- routine library usage;
- obvious implementation details;
- temporary workarounds;
- choices already enforced by code, tests, config, or local skills;
- decisions that belong in a spec because they describe product behavior;
- edge-case behavior that the user/spec has not decided yet.

## Status meanings

- `proposed`: written but not accepted yet;
- `accepted`: the project should follow it;
- `superseded`: replaced by a newer ADR;
- `deprecated`: no longer recommended but not fully replaced.

## Revisit triggers

Every ADR should say when to reconsider it.

Examples:

- scale changes by an order of magnitude;
- a dependency becomes unmaintained;
- a new platform constraint appears;
- implementation cost exceeds expectation;
- a better test seam or simpler architecture becomes available;
- the product requirement that justified the decision disappears.
