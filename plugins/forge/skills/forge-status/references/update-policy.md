# Update policy

Update `docs/status.md` after meaningful work, not after every tiny edit.

## Update when

- A feature slice was implemented.
- A bug was reproduced or fixed.
- A spec was created or materially changed.
- A plan was created or a slice status changed.
- An ADR was created or accepted.
- The next action changed.
- The user corrected the direction and future work should continue differently.

## Do not update when

- Only formatting changed.
- A typo was fixed.
- The current status already describes the state accurately.
- The only new information belongs in a spec, plan, ADR, or local skill.

## Staleness rules

If status conflicts with code or Git diff:

- trust concrete project state over status;
- update status to reflect reality;
- mention uncertainty if the state cannot be verified.

## Validation language

Use precise language:

- "Validated with `npm test`" only if that command ran and passed.
- "Failed: `npm test` ..." when validation failed.
- "Not validated" if no validation was run.
- "Could not validate because ..." when validation was attempted but blocked by the environment.
