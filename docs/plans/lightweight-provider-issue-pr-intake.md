# Plan: Lightweight provider issue and PR intake

Created: 2026-05-31
Status: done

Spec: `docs/specs/lightweight-provider-issue-pr-intake.md`

## Strategy

Replace the heavier provider issue/PR intake direction with a smaller documentation-only slice: preserve the old artifacts as superseded history, create new lightweight artifacts, simplify skill guidance, and keep manifests at the current unreleased `0.2.2` version.

## Slices

### 1. Preserve the old direction and create lightweight artifacts

Status: completed

Outcome:
- The old provider issue/PR idea, spec, and plan are retained and marked superseded.
- New lightweight idea, spec, and plan artifacts describe the revised scope.

Validation:
- Confirm old artifacts link to the new lightweight artifacts.
- Confirm new artifacts link back to the superseded artifacts.

### 2. Simplify Forge skill guidance

Status: completed

Outcome:
- `forge-next` remains the main place for detailed issue/PR routing behavior.
- Common direct-entry skills use one concise issue/PR context-intake step.
- Provider write-back/comment policy is removed from changed skill guidance.

Validation:
- Search direct-entry skills for the concise issue/PR intake sentence.
- Search changed skills for removed provider-comment/write-back policy text.
- Check `forge-review` for non-duplicative PR-review trigger wording.

### 3. Keep package metadata stable and validate

Status: completed

Outcome:
- Forge plugin manifests remain at `0.2.2` because that version is not merged or released yet.
- Status reflects the lightweight artifacts as the active implementation history.

Validation:
- Run `git diff --check`.
- Confirm both Forge plugin manifests declare `0.2.2`.
- Review final diff for accidental provider write-back scope or new provider abstractions.

## Risks

- Direct-entry support is intentionally concise; very detailed provider behavior should stay in `forge-next` unless repeated direct-entry failures show otherwise.
- Future provider write-back behavior needs its own idea/spec/plan because it has different safety and confirmation requirements.

## Links

- Status: `docs/status.md`
- Idea: `docs/ideas/lightweight-provider-issue-pr-intake.md`
- Spec: `docs/specs/lightweight-provider-issue-pr-intake.md`
- Superseded plan: `docs/plans/provider-issue-pr-intake.md`
