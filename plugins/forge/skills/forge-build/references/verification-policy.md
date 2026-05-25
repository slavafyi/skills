# Verification policy

Use precise validation language.

## Report exact commands

Say what ran:

```md
Passed:
- `npm test -- user-settings`
- `npm run typecheck`
```

Say what failed:

```md
Failed:
- `npm test` failed in `checkout.spec.ts` with ...
```

Say what did not run:

```md
Not run:
- E2E tests, because the dev server could not start without local credentials.
```

## Choose validation depth

Prefer this order:

1. Narrowest check that proves the changed behavior.
2. Related integration or regression tests.
3. Typecheck or build.
4. Lint or format check when relevant.
5. Manual check when automation is missing.

Run broader checks before declaring a large or risky change done.

## Manual validation

Manual validation is acceptable only when automated validation is unavailable or not useful.

Record:

- what was checked;
- what was observed;
- what was not covered.

## Failed validation

When validation fails:

- do not declare success;
- isolate whether the failure is caused by your change;
- do not stack random fixes;
- route to `forge-fix` when the root cause is unclear;
- record the blocker when it is outside scope.

## Status wording

Use:

- `Validated with ...` only for commands/checks that ran and passed.
- `Partially validated with ...` when coverage is incomplete.
- `Not validated` when nothing meaningful ran.
- `Validation blocked by ...` when an attempted check could not run.
