# Idea: Lightweight provider issue and PR intake

Created: 2026-05-31
Status: implemented

Replaces: `docs/ideas/provider-issue-intake.md`

## Summary

Treat issue and PR references as lightweight context for existing Forge workflows. Keep `forge-next` as the main router, add only concise direct-entry support to common Forge skills, and leave provider write-back/comment behavior for a separate future idea.

## Problem or opportunity

- Users naturally start work from issue or PR references such as `issue #2` or `review PR #5`.
- The first implementation repeated too much policy across skills and mixed context intake with provider write-back behavior.
- Forge should keep skills small and composable: provider records are context, not a separate workflow lifecycle.

## Options considered

### Option A: Lightweight direct-skill support plus `forge-next` routing

- Keep detailed issue/PR routing in `forge-next` references.
- Add one short context-intake line to direct-entry skills.
- Remove provider write-back/comment behavior from this branch.
- Selected because it supports direct entry without making every skill carry a long policy block.

### Option B: New provider intake skill

- Rejected for now because issue/PR references do not represent an outcome by themselves.
- A request such as `review PR #5` should still activate `forge-review`; a request such as `write a spec from issue #2` should still activate `forge-spec`.

### Option C: Shared provider reference file

- Deferred because individual Forge skills should stay understandable when loaded alone.
- A shared reference may be useful later if provider context intake grows beyond a short local rule.

## Recommendation

- Keep provider issue/PR intake as a small context-gathering improvement.
- Use `forge-next` for detailed routing behavior.
- In direct-entry skills, say only that issue/PR references should be fetched as context first and blockers should result in an ask for a URL, setup, or pasted context.
- Do not include provider write-back, comments, formal review submission, or new provider abstractions in this slice.

## Links

- Status: `docs/status.md`
- Spec: `docs/specs/lightweight-provider-issue-pr-intake.md`
- Superseded idea: `docs/ideas/provider-issue-intake.md`
