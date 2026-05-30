---
name: forge-fix
description: Diagnose and fix the root cause of broken behavior. Use when the user reports a bug, validation fails, behavior regresses, or implementation reveals an error that should not be patched blindly.
---

# forge-fix

Reproduce the bug, find the root cause, and fix only after the cause is understood.

## Use when

- The user reports a bug, regression, broken behavior, or failed validation.
- A failure appears during implementation and needs root-cause diagnosis before changes.
- A symptom needs reproduction, a feedback loop, and a minimal verified fix.
- The user says "Fix this bug", "This broke", "Tests are failing", "Find the root cause", or asks to fix a bug from an issue/PR.

## Procedure

1. Read relevant context: user report, `docs/status.md`, active spec/plan, ADRs, local skills, Git status, and current diff.
2. If the prompt includes an issue or PR URL or shorthand reference, use provider CLI docs/help/output to fetch minimum useful context before normal work; full URLs are authoritative, shorthand requires an unambiguous current Git remote, and blocked or ambiguous access should become a clear ask instead of guessed content.
3. Before making persistent repository changes for reproduction, probes, tests, or fixes, follow Branch Safety below and get confirmation when it applies.
4. Build a feedback loop with `references/diagnosis-loop.md` before editing production code.
5. Reproduce the same symptom the user reported or the same validation failure that blocked work.
6. Form falsifiable hypotheses and test one variable at a time until there is evidence for the root cause.
7. Before changing production code, record the observed behavior, expected behavior, reproduction path, evidence for the suspected root cause, and smallest safe fix.
8. If the issue or cause is too vague, a missing requirement, an unclear edge case, or a design conflict, stop and route to `forge-spec` or the user instead of inventing behavior or patching the symptom.
9. Add regression proof when there is a correct seam, using `references/regression-policy.md`. Use `forge-test` when choosing the regression layer, seam, fixture, TDD loop, contract, property test, real-dependency strategy, or CI tier is non-trivial.
10. Make the smallest root-cause fix, remove temporary probes, re-run validation, and update status/plan when meaningful.

## Branch Safety

Before making persistent repository changes for reproduction, probes, tests, or fixes:

- Treat code, docs, config, runbooks, tests, examples, assets, manifests, and other tracked or intended-to-be-tracked project artifacts as covered changes.
- Check the current branch, Git status, and existing local/remote branch names.
- Ask first when on a shared/protected branch such as `main`, `master`, `dev`, `develop`, `trunk`, `staging`, `production`, `prod`, `release/*`, detached HEAD, a mismatched branch, or when unrelated uncommitted changes may be mixed in.
- Use the available structured ask/confirm tool when possible; otherwise ask in chat and wait.
- Offer: continue here, create a new branch, create a worktree, or stop.
- Before creating a branch, infer the naming convention from existing branches; if unclear, ask.

## Output

```md
Bug:
- ...

Reproduction:
- ...

Root cause:
- ...

Fix:
- ...

Regression proof:
- ...

Validation:
- ...

Next action:
- ...
```

## Constraints

- Do not guess-fix without trying to reproduce.
- Do not patch symptoms while the root cause is unknown.
- Do not start a code fix until the root cause has evidence from reproduction, probes, or inspected code paths.
- Do not turn an unspecified edge case into code without spec/user confirmation and a recorded intended behavior.
- Do not make persistent repository changes on a protected, shared, or mismatched branch without explicit user confirmation or a user-approved branch/worktree.
- Do not continue editing when the evidence points to a design/spec gap rather than a code defect.
- Do not change multiple unrelated things at once.
- Do not leave debug probes behind.
- Do not claim the bug is fixed without re-running the reproduction or explaining why that was impossible.
- Do not write a regression test that only matches the fix implementation rather than the original failing behavior.
- Do not write provider comments without explicit user confirmation.

## References

- `references/diagnosis-loop.md`
- `references/regression-policy.md`
