# Project status

Updated: 2026-05-31

## Current focus

- Provider issue/PR intake implementation is complete; ready for `forge-review`.

## Recent work

- Addressed initial `forge-review` findings by aligning the idea note's provider-comment path guidance, adding provider-comment policy to `forge-test`, and adding direct-entry multiple-reference/type-mismatch ask behavior.
- Implemented slice 4 of `docs/plans/provider-issue-pr-intake.md`.
- Synced Forge plugin manifests to `0.2.2` and marked the provider issue/PR intake spec, plan, and idea as implemented/done.
- Implemented slice 3 of `docs/plans/provider-issue-pr-intake.md`.
- Added provider-comment policy to Forge task skills that can produce provider-facing updates: comments are external mutations, require ask/confirm, offer skip/new/update plus summary/full choices, and avoid overclaiming local-only artifact paths.
- Implemented slice 2 of `docs/plans/provider-issue-pr-intake.md`.
- Updated common Forge task skills so direct issue/PR references are fetched as context before normal idea/spec/plan/fix/build/test/review/status work.
- Added direct-entry safeguards for full URLs, shorthand references with unambiguous Git remotes, blocked provider CLI access, vague issues, PR diffs/review feedback, and default PR review artifact behavior.
- Implemented slice 1 of `docs/plans/provider-issue-pr-intake.md`.
- Updated `forge-next` to treat issue and PR references as context intake before central routing, including URL-first behavior, shorthand Git-remote resolution, and ask-on-ambiguity/blocker behavior.
- Created the provider issue/PR intake spec, plan, and idea artifacts.
- Refined provider comment behavior so artifact paths are only advertised when expected to exist remotely.
- Marked the related idea note ready for spec and linked the new spec.
- Previous lazy artifact folder work is complete; no follow-up is active from that slice.

## Next action

- Run `forge-review` on the completed provider issue/PR intake implementation.

## Open questions

- None blocking; real-project testing may reveal provider-specific patterns worth documenting later.

## Validation

- Passed: `git diff --check`.
- Passed: targeted search confirmed stale provider-comment artifact-path wording was removed from the idea note.
- Passed: targeted search confirmed direct-entry skills mention multiple-reference/type-mismatch ask behavior.
- Passed: targeted search confirmed `forge-test` has provider-comment confirmation, summary/full, and remote-visible path policy.
- Passed: Forge manifest version consistency check with `python -c`; both Forge plugin manifests are `0.2.2`.
- Passed: targeted search found no provider-specific CLI names in `plugins/forge/skills`.
- Passed: manual review confirmed provider adapter/registry/command-table references in skill files are prohibitions, not implementations.
- Passed: targeted search found no default `docs/reviews/` behavior; the only skill reference says not to create it by default.
- Passed: targeted search confirmed provider-comment sections include ask/confirm, skip, new/update, summary/full, and remote-visible/local-unpushed path wording.
- Passed: targeted search found no provider-specific automatic write guidance.
- Passed: targeted search confirmed direct-entry issue/PR intake wording across `forge-idea`, `forge-spec`, `forge-plan`, `forge-fix`, `forge-build`, `forge-test`, `forge-review`, and `forge-status`.
- Passed: targeted search found no provider-specific CLI names in direct-entry skill changes.
- Passed: targeted search confirmed `forge-review` does not create `docs/reviews/` by default.
- Passed: targeted search found no provider-specific CLI names in `plugins/forge/skills/forge-next`.
- Passed: targeted search confirmed the changed `forge-next` guidance includes URL-first behavior, shorthand behavior, ask-on-ambiguity, provider CLI blocker handling, and normal Forge routing.
- Passed: manual prompt walkthroughs for `check issue #2 and write a spec` and `review PR #5` through `forge-next` routing.
- Not run: package validation; changes are Markdown skill guidance and JSON manifests only.
- Not run: optional real provider CLI smoke test; no safe real issue/PR target was provided.

## Relevant artifacts

- Idea: `docs/ideas/provider-issue-intake.md`
- Spec: `docs/specs/provider-issue-pr-intake.md`
- Plan: `docs/plans/provider-issue-pr-intake.md`
