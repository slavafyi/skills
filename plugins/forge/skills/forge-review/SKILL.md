---
name: forge-review
description: Review a user-selected diff, branch, commit, or pull request for correctness, regressions, safety, test adequacy, and maintainability. Use when the user explicitly asks for review or readiness assessment. Do not trigger merely because a working tree has uncommitted changes.
---

# forge-review

Review the selected changes as a future maintainer. Do not rewrite them unless
the user asks for review-and-fix.

## Procedure

1. Identify the exact review target and comparison base.
2. Read the request, issue or acceptance criteria, repository instructions,
   relevant ADRs, and validation evidence when available.
3. Inspect tracked and untracked changes. Use history or surrounding code only
   where it helps establish intent or risk.
4. Review in the priority order in `references/review-checklist.md`.
5. Run the smallest relevant validation when practical. Distinguish observed
   results from claims in a PR description or prior session.
6. Report actionable findings using `references/output-format.md`.

## Constraints

- Findings come first; do not bury defects in a general summary.
- Report only issues introduced by or directly relevant to the review target.
- Prefer correctness, data safety, security, and missing behavior over style.
- Include a concrete fix direction and precise location for every finding.
- Do not approve work that was not inspected.
- Do not claim checks ran unless they ran in this review.
- Do not edit, commit, push, merge, or deploy unless explicitly requested.

## References

- `references/review-checklist.md`
- `references/output-format.md`
