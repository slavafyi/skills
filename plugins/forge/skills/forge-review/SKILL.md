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
- The user says "Review this", "Self-review", "Check the diff", "Review the PR", or asks to review a PR reference.

## Procedure

1. Identify the review target: working tree diff, files, commit, branch, or PR.
2. If the prompt includes an issue or PR URL or shorthand reference, use provider CLI docs/help/output to fetch minimum useful context before normal work; full URLs are authoritative, shorthand requires an unambiguous current Git remote, and blocked or ambiguous access should become a clear ask instead of guessed content.
3. For PR references, include relevant PR context, changed files or diff information, and review feedback when needed before applying normal review behavior.
4. Read relevant context: `docs/status.md`, active spec/plan, ADRs, local skills, and validation results.
5. Inspect tracked and untracked changes. Distinguish user changes from agent changes when possible.
6. Review with `references/review-checklist.md`, prioritizing correctness, requirements, data safety, failure modes, test adequacy, and maintainability.
7. Treat symptom patches and unspecified edge-case behavior as design issues, not style nits.
8. Report findings with `references/output-format.md`.
9. Route follow-up: `forge-fix` for confirmed bugs, `forge-test` for missing or weak automated proof, `forge-spec` for missing requirements, `forge-plan` for sequencing issues, `forge-adr` for durable architecture choices, `forge-status` after meaningful changes.

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
- Do not create `docs/reviews/` by default for PR reviews; update existing Forge artifacts only when durable context needs it.
- Do not post provider feedback or comments without explicit user confirmation.

## References

- `references/review-checklist.md`
- `references/output-format.md`
