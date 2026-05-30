---
name: forge-review
description: Review a diff, branch, pull request, or completed slice against project intent, specs, ADRs, local skills, validation, and maintainability. Use when the user asks for review, self-review, PR review, or when uncommitted changes need inspection.
---

# forge-review

Review the selected changes as a future maintainer. Do not rewrite code unless asked.

## Use when

- The user asks for review, self-review, PR review, or inspection of current changes.
- A diff, branch, commit, or completed slice needs checking against project intent.
- Readiness, validation, maintainability, or compliance with specs/ADRs/local skills is uncertain.
- The user says "Review this", "Self-review", "Check the diff", or "Review the PR".

## Procedure

1. Identify the review target: working tree diff, files, commit, branch, or PR.
2. Read relevant context: `docs/status.md`, active spec/plan, ADRs, local skills, and validation results.
3. Inspect tracked and untracked changes. Distinguish user changes from agent changes when possible.
4. Review with `references/review-checklist.md`, prioritizing correctness, requirements, data safety, failure modes, test adequacy, and maintainability.
5. Treat symptom patches and unspecified edge-case behavior as design issues, not style nits.
6. Report findings with `references/output-format.md`.
7. Route follow-up: `forge-fix` for confirmed bugs, `forge-test` for missing or weak automated proof, `forge-spec` for missing requirements, `forge-plan` for sequencing issues, `forge-adr` for durable architecture choices, `forge-status` after meaningful changes.

## Output

```md
Review target:
- ...

Summary:
- ...

Blocking issues:
- ...

Non-blocking issues:
- ...

Tests and validation:
- ...

Readiness:
- Ready / Not ready / Ready after ...
```

## Constraints

- Do not approve work that was not inspected.
- Do not claim validation was run unless it was run.
- Do not treat claimed validation from another agent or artifact as observed validation unless command output, logs, or direct evidence are available.
- Do not bury correctness issues under style comments.
- Do not rewrite the diff unless asked.
- Do not merge, deploy, push, or mark a PR ready unless explicitly instructed.

## References

- `references/review-checklist.md`
- `references/output-format.md`
