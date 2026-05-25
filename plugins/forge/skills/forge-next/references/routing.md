# Routing

Use this guide after reading project context.

## Missing Forge artifacts

If `docs/status.md` is missing:

- route to `forge-init`;
- do not create a large documentation tree.

## Existing uncommitted changes

If there are uncommitted changes:

- understand whether they are intentional;
- compare them to the active status/spec/plan;
- route to `forge-review` when the diff needs inspection;
- route to `forge-status` when work is complete but status is stale;
- ask before modifying when changes look accidental.

## Vague idea

If the user gives a raw idea and no clear requirements:

- route to `forge-idea`.

## Clear feature/change but no spec

If the goal is clear but not specified:

- route to `forge-spec`.

## Ready spec but no plan

If an active spec exists and the next implementation slice is not obvious:

- route to `forge-plan`.

## Ready plan or clear small target

If there is a ready plan with a next slice, or the user gave a small explicit code target:

- route to `forge-build`.

## Bug, failing validation, or broken behavior

If behavior is broken, validation failed, or a previous implementation exposed an error:

- route to `forge-fix` when the root cause is unknown;
- route to `forge-spec` when the issue is unspecified behavior or an edge-case design question;
- do not patch symptoms directly from `forge-next`.

## Review request or uncertain diff

If the user asks for review or the current diff needs inspection:

- route to `forge-review`.

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
