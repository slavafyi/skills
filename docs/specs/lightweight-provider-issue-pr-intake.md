# Spec: Lightweight provider issue and PR intake

Created: 2026-05-31
Status: implemented

Replaces: `docs/specs/provider-issue-pr-intake.md`

## Goal

Forge workflows should accept issue and PR references as context without adding a provider framework, a new skill, or provider write-back behavior. `forge-next` remains the main router, and direct-entry skills only need a concise rule for fetching referenced context before normal work.

## Scope

### In scope

- Detecting issue and PR references in user prompts, including URLs and shorthand references like `#2`, `issue #2`, and `PR #5`.
- Using `forge-next` routing guidance to resolve provider context before choosing the normal Forge skill.
- Adding concise direct-entry support to common Forge skills so prompts like `write a spec from issue #2` or `review PR #5` do not lose context when `forge-next` is bypassed.
- Asking for a URL, provider setup, or pasted context when reference resolution or provider access is blocked.
- Keeping local `docs/` artifacts canonical when the routed Forge workflow normally creates or updates them.

### Out of scope

- Provider write-back, provider comments, formal review submission, labels, issue creation, PR creation, or provider metadata changes.
- A new `forge-provider-*` skill or provider-specific workflow lifecycle.
- Shared provider reference files that direct skills must load to be understandable.
- Hard-coded provider adapters, provider registries, or maintained provider-specific command tables.
- Bumping Forge manifests beyond the current unreleased `0.2.2` package version.

## Requirements

- `forge-next` must treat issue and PR references as context intake before routing.
- `forge-next` should keep the detailed behavior for full URLs, shorthand references, provider CLI blockers, and minimum useful context.
- Common direct-entry skills should use one concise procedure step for issue/PR references rather than repeating detailed provider policy.
- Direct-entry skills should ask for a URL, setup, or pasted context when resolution or provider access is blocked instead of inventing issue or PR content.
- Direct-entry wording should avoid duplicated PR-review trigger phrases.
- Provider write-back/comment behavior must not be implemented in this slice.
- The existing `0.2.2` Forge plugin manifest version should remain unchanged because it is not merged or released yet.

## Acceptance criteria

- [x] `forge-next` still contains the detailed issue/PR intake and routing guidance.
- [x] Common direct-entry Forge skills contain only concise issue/PR context-intake guidance.
- [x] `forge-review` trigger wording is simplified and does not duplicate PR-review phrases.
- [x] Provider write-back/comment policy text is absent from the changed skills.
- [x] No new provider intake skill, provider adapter, provider registry, or provider command table is added.
- [x] Old provider intake idea/spec/plan artifacts are marked superseded rather than rewritten into the lightweight direction.
- [x] New lightweight idea/spec/plan artifacts describe the revised direction.
- [x] Forge plugin manifests remain synced at `0.2.2`.

## Behavior details

- Issue context can feed normal idea, spec, plan, fix, build, test, review, or status workflows depending on the user intent.
- PR context can feed normal review, summary, follow-up implementation, test, status, or planning workflows depending on the user intent.
- Full URLs and shorthand resolution details live in `forge-next` references.
- Direct-entry skills intentionally stay short and defer provider-specific mechanics to agent judgment and available provider tooling.

## Validation expectations

- Run `git diff --check`.
- Confirm both Forge plugin manifests are `0.2.2`.
- Search changed Forge skill files for removed provider-comment/write-back policy.
- Search direct-entry skills for the concise issue/PR intake sentence.
- Confirm old provider intake artifacts are superseded and new lightweight artifacts exist.

## Links

- Status: `docs/status.md`
- Idea: `docs/ideas/lightweight-provider-issue-pr-intake.md`
- Plan: `docs/plans/lightweight-provider-issue-pr-intake.md`
- Superseded spec: `docs/specs/provider-issue-pr-intake.md`
