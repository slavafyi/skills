# Project status

Updated: 2026-05-31

## Current focus

- Slice 2 of provider issue/PR intake is implemented; ready to add provider-comment confirmation policy in slice 3.

## Recent work

- Implemented slice 2 of `docs/plans/provider-issue-pr-intake.md`.
- Updated common Forge task skills so direct issue/PR references are fetched as context before normal idea/spec/plan/fix/build/test/review/status work.
- Added direct-entry safeguards for full URLs, shorthand references with unambiguous Git remotes, blocked provider CLI access, vague issues, PR diffs/review feedback, and default PR review artifact behavior.
- Implemented slice 1 of `docs/plans/provider-issue-pr-intake.md`.
- Updated `forge-next` to treat issue and PR references as context intake before central routing, including URL-first behavior, shorthand Git-remote resolution, and ask-on-ambiguity/blocker behavior.
- Forge plugin manifest version bump remains pending before merge.
- Created a ready spec for lightweight provider issue and PR intake.
- Created an active implementation plan for lightweight provider issue and PR intake.
- Refined provider comment behavior so artifact paths are only advertised when expected to exist remotely.
- Marked the related idea note ready for spec and linked the new spec.
- Previous lazy artifact folder work is complete; no follow-up is active from that slice.

## Next action

- Start slice 3 of `docs/plans/provider-issue-pr-intake.md`: add provider-comment confirmation and remote-visible artifact policy.

## Open questions

- None blocking; real-project testing may reveal provider-specific patterns worth documenting later.

## Validation

- Passed: `git diff --check`.
- Passed: targeted search confirmed direct-entry issue/PR intake wording across `forge-idea`, `forge-spec`, `forge-plan`, `forge-fix`, `forge-build`, `forge-test`, `forge-review`, and `forge-status`.
- Passed: targeted search found no provider-specific CLI names in direct-entry skill changes.
- Passed: targeted search confirmed `forge-review` does not create `docs/reviews/` by default.
- Passed: targeted search found no provider-specific CLI names in `plugins/forge/skills/forge-next`.
- Passed: targeted search confirmed the changed `forge-next` guidance includes URL-first behavior, shorthand behavior, ask-on-ambiguity, provider CLI blocker handling, and normal Forge routing.
- Passed: manual prompt walkthroughs for `check issue #2 and write a spec` and `review PR #5` through `forge-next` routing.
- Not run: package validation; only Markdown skill guidance changed in the committed slices. Forge manifest bump is intentionally left uncommitted until the metadata slice.

## Relevant artifacts

- Idea: `docs/ideas/provider-issue-intake.md`
- Spec: `docs/specs/provider-issue-pr-intake.md`
- Plan: `docs/plans/provider-issue-pr-intake.md`
