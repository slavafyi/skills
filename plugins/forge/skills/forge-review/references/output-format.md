# Review output format

Use this shape for review results.

```md
Review target:
- <diff, branch, commit, PR, or files>

Summary:
- <one to three bullets>

Blocking issues:
1. [High] `<path>` — <issue>
   - Why it matters:
   - Suggested fix:

Non-blocking issues:
1. [Medium/Low] `<path>` — <issue>
   - Why it matters:
   - Suggested fix:

Tests and validation:
- Observed:
- Missing:
- Suggested:

Readiness:
- Ready / Not ready / Ready after <specific fixes>
```

## Severity

- `High`: likely bug, data loss, security issue, broken requirement, unsafe migration, failed validation, symptom patch, or unspecified edge-case behavior.
- `Medium`: maintainability issue, missing important test, unclear behavior, or likely future bug.
- `Low`: readability or convention issue that does not block shipping.

## No findings

When no major issues are found, say so directly:

```md
No blocking issues found in the inspected diff.
```

Still include validation status and any non-blocking notes.

## Self-review-and-fix mode

When the user asks to review and fix:

1. Run the review.
2. Fix only clear issues inside the requested scope.
3. Re-run relevant validation.
4. Report what was found and fixed.

Do not silently make broad taste-based rewrites.
