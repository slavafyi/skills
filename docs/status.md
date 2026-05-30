# Project status

Updated: 2026-05-31

## Current focus

- Slice 1 of provider issue/PR intake is implemented; ready to start direct-entry skill updates in slice 2.

## Recent work

- Implemented slice 1 of `docs/plans/provider-issue-pr-intake.md`.
- Updated `forge-next` to treat issue and PR references as context intake before central routing, including URL-first behavior, shorthand Git-remote resolution, and ask-on-ambiguity/blocker behavior.
- Forge plugin manifest version bump remains pending before merge.
- Created a ready spec for lightweight provider issue and PR intake.
- Created an active implementation plan for lightweight provider issue and PR intake.
- Refined provider comment behavior so artifact paths are only advertised when expected to exist remotely.
- Marked the related idea note ready for spec and linked the new spec.
- Previous lazy artifact folder work is complete; no follow-up is active from that slice.

## Next action

- Start slice 2 of `docs/plans/provider-issue-pr-intake.md`: add direct-entry issue and PR intake to common Forge task skills.

## Open questions

- None blocking; real-project testing may reveal provider-specific patterns worth documenting later.

## Validation

- Passed: `git diff --check`.
- Passed: targeted search found no provider-specific CLI names in `plugins/forge/skills/forge-next`.
- Passed: targeted search confirmed the changed `forge-next` guidance includes URL-first behavior, shorthand behavior, ask-on-ambiguity, provider CLI blocker handling, and normal Forge routing.
- Passed: manual prompt walkthroughs for `check issue #2 and write a spec` and `review PR #5` through `forge-next` routing.
- Not run: package validation; only Markdown skill guidance changed in the committed slice. Forge manifest bump is intentionally left uncommitted for before merge.

## Relevant artifacts

- Idea: `docs/ideas/provider-issue-intake.md`
- Spec: `docs/specs/provider-issue-pr-intake.md`
- Plan: `docs/plans/provider-issue-pr-intake.md`
