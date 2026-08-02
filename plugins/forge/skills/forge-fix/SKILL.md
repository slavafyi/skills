---
name: forge-fix
description: Diagnose and fix the root cause of a reported bug, regression, or failing validation. Use when broken behavior needs reproduction and evidence before editing. Do not use for routine implementation, typo fixes, planning, test-only requests, or code review.
---

# forge-fix

Reproduce the failure, identify its root cause, and make the smallest verified
fix.

## Procedure

1. Read the report, current diff, relevant code paths, callers, tests, and
   repository instructions.
2. Build the smallest reliable feedback loop from
   `references/diagnosis-loop.md`.
3. Confirm the observed failure matches the report.
4. Trace the failing path far enough to identify the shared root cause. Check
   sibling callers before adding a local guard.
5. Record the observed behavior, expected behavior, evidence, root cause, and
   smallest safe fix before editing production code.
6. If several materially different product, data, security, or compatibility
   outcomes are reasonable, ask the user. Otherwise follow established project
   behavior and state any low-risk assumption.
7. Add focused regression proof when practical, using
   `references/regression-policy.md`.
8. Apply the root-cause fix, remove temporary probes, and rerun the reproduction
   plus relevant validation.

## Output

Keep the report proportional to the bug. Usually include only:

- root cause;
- fix;
- regression proof;
- validation and any remaining limitation.

## Constraints

- Do not guess-fix without evidence.
- Do not patch one caller when the defect belongs in a shared path.
- Do not weaken or delete checks merely to make validation pass.
- Do not leave debug instrumentation behind.
- Do not claim success without rerunning the failure signal, or explaining why
  that was impossible.
- Do not commit, push, merge, deploy, or discard unrelated user changes unless
  explicitly requested.

## References

- `references/diagnosis-loop.md`
- `references/regression-policy.md`
