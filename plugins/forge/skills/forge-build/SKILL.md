---
name: forge-build
description: Implement one small verified slice from a plan, spec, issue, or explicit request. Use when the next implementation target is clear enough to code without inventing requirements.
---

# forge-build

Implement one focused slice and prove it works.

## Use when

- The next implementation target is explicit or selected from a ready plan/spec.
- One small vertical slice can be coded and validated without inventing requirements.
- The user asks to implement a clear, bounded change.
- The user says "Implement this", "Build the next slice", "Start the plan", or "Make the change".

## Procedure

1. Read the nearest useful context: `docs/status.md`, active plan/spec, ADRs, project-local skills, Git status, and current diff.
2. Select exactly one target: user-named task, first pending plan slice, next clear acceptance criterion, or a small explicit code request.
3. If the target is ambiguous, requirements are missing, or slicing is needed, stop and route to `forge-spec` or `forge-plan`.
4. Before making persistent repository changes, follow Branch Safety below and get confirmation when it applies.
5. Define the feedback signal before editing: test, typecheck, build, lint, manual check, or runtime check.
6. Implement the smallest complete change for the selected slice.
7. When validation fails or a surprising edge case appears, stop and diagnose before editing further. Identify the observed signal, expected behavior, likely root cause, and whether the spec/design covers it.
8. Use `forge-fix` for reproducible broken behavior; return to `forge-spec` or the user when the edge case is unspecified or reveals a design conflict.
9. Validate, update plan/status when meaningful, and report changed files plus exact validation results.

## Branch Safety

Before making persistent repository changes:

- Treat code, docs, config, runbooks, tests, examples, assets, manifests, and other tracked or intended-to-be-tracked project artifacts as covered changes.
- Check the current branch, Git status, and existing local/remote branch names.
- Ask first when on a shared/protected branch such as `main`, `master`, `dev`, `develop`, `trunk`, `staging`, `production`, `prod`, `release/*`, detached HEAD, a mismatched branch, or when unrelated uncommitted changes may be mixed in.
- Use the available structured ask/confirm tool when possible; otherwise ask in chat and wait.
- Offer: continue here, create a new branch, create a worktree, or stop.
- Before creating a branch, infer the naming convention from existing branches; if unclear, ask.

## Output

```md
Implemented:
- ...

Changed files:
- ...

Validation:
- Passed: `...`
- Failed: `...`
- Not run: `...` because ...

Updated artifacts:
- ...

Next action:
- ...
```

## Constraints

- Do not implement broad vague requests without a spec, plan, or explicit small target.
- Do not patch symptoms when the root cause is unknown.
- Do not resolve unspecified edge cases in code; return to spec/design discussion first, then update the spec/plan before implementing the chosen behavior.
- Do not make persistent repository changes on a protected, shared, or mismatched branch without explicit user confirmation or a user-approved branch/worktree.
- Do not rewrite unrelated code or discard user changes.
- Do not claim validation passed unless it actually ran and passed.
- Do not create PRs, merge, deploy, or run destructive commands unless explicitly instructed.

## References

- `references/build-loop.md`
- `references/verification-policy.md`
- `references/stop-policy.md`
