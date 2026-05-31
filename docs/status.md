# Project status

Updated: 2026-05-31

## Current focus

- Lightweight provider issue/PR intake implementation is complete and reviewed.

## Recent work

- Created new lightweight provider issue/PR intake idea, spec, and plan artifacts.
- Marked the earlier provider issue/PR intake idea, spec, and plan as superseded instead of rewriting them into the new direction.
- Kept `forge-next` as the main router and trimmed duplicate issue/PR trigger wording across direct-entry skills.
- Removed provider write-back policy from this branch; provider comments/write-back need a separate future idea/spec/plan.
- Kept Forge plugin manifests at `0.2.2` because that package version is not merged or released yet.
- Previous lazy artifact folder work is complete; no follow-up is active from that slice.

## Next action

- No implementation follow-up is active; review/stage/commit the changed and new files, then push or open a PR when ready.

## Open questions

- None blocking.

## Validation

- Passed: `git diff --check`.
- Passed: targeted search confirmed provider write-back policy text was removed from affected skills.
- Passed: targeted search confirmed issue/PR intake wording was simplified across `forge-next` and direct-entry skills.
- Passed: targeted search confirmed old provider issue/PR artifacts are superseded and new lightweight artifacts exist.
- Passed: manifest version consistency check; both Forge plugin manifests remain `0.2.2`.
- Not run: package validation; changes are Markdown docs and skill guidance only. Manifests were inspected for version consistency but are unchanged.

## Relevant artifacts

- Active idea: `docs/ideas/lightweight-provider-issue-pr-intake.md`
- Active spec: `docs/specs/lightweight-provider-issue-pr-intake.md`
- Active plan: `docs/plans/lightweight-provider-issue-pr-intake.md`
- Superseded idea: `docs/ideas/provider-issue-intake.md`
- Superseded spec: `docs/specs/provider-issue-pr-intake.md`
- Superseded plan: `docs/plans/provider-issue-pr-intake.md`
