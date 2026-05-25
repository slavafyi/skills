# Artifact routing

Route each lesson to the smallest correct artifact.

## `docs/status.md`

Use status when the lesson is about continuation:

- where the work stopped;
- what was fixed;
- what remains;
- what the next action is;
- what validation is known.

Example:

> The implementation was corrected to keep the logic local. Next step: add tests for the revised code path.

## `docs/specs/<slug>.md`

Use a spec when requirements changed:

- new acceptance criteria;
- changed behavior;
- clarified scope;
- removed feature scope;
- important edge case;
- design ambiguity that must be decided before implementation.

Example:

> The feature must not add a new settings page; it should reuse the existing preferences panel.

## `docs/plans/<slug>.md`

Use a plan when implementation sequencing changed but requirements did not:

- a slice should be split or reordered;
- validation per slice changed;
- a dependency or stop condition was discovered;
- a planned step is now blocked or done.

Example:

> Split the settings migration into a read-only compatibility slice before changing write behavior.

## `docs/adr/<id>-<slug>.md`

Use ADR only for important technical or architectural decisions:

- hard to reverse;
- affects architecture, data, API, security, deployment, or long-term DX;
- has reasonable alternatives;
- future agents may otherwise undo it.

Example:

> Keep server state in TanStack Query rather than duplicating it in a global client store.

## Project-local skill

Use a local skill when the lesson changes how agents should work in this repository:

- code organization style;
- abstraction boundaries;
- testing pattern;
- API conventions;
- UI conventions;
- review checks;
- recurring edge-case handling rule.

Example:

> Do not introduce a service layer for feature-local logic unless there is reuse or an existing architectural boundary.

## Suggested Forge core change

Use this when the lesson is universal across projects and belongs in the Forge plugin itself.

Do not edit Forge skills from an ordinary project. Report a suggested change instead.

## No persistence

Use no persistence when the lesson is not durable.

Examples:

- one-off rename;
- temporary workaround;
- preference already captured elsewhere;
- correction specific to one deleted implementation.
