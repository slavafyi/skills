# Routing

Use this routing guide after reading project context.

## Missing Forge artifacts

If `docs/status.md` is missing:

- route to `forge-init`;
- do not create a large documentation tree.

## Existing uncommitted changes

If there are uncommitted changes:

- understand whether they are intentional;
- compare them to the active status/spec;
- if they need review, route to `forge-review`;
- if the work is complete but status is stale, route to `forge-status`;
- if changes look accidental, ask before modifying.

## Vague idea

If the user gives a raw idea and no clear requirements:

- route to `forge-idea`.

## Clear feature/change but no spec

If the goal is clear but not specified:

- route to `forge-spec`.

## Existing spec ready for implementation

If there is an active spec with clear acceptance criteria:

- route to `forge-build`.

## Bug report

If the user reports broken behavior:

- route to `forge-fix`.

## Important technical decision

If a durable architectural decision was made or is needed:

- route to `forge-adr`.

## User correction or process lesson

If the user corrected the agent and wants the lesson preserved:

- route to `forge-retro`.

## Nothing obvious

If several next steps are plausible:

- ask one short question;
- include the two or three likely choices.
