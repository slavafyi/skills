# Plan: Provider issue and PR intake

Created: 2026-05-31
Status: done

Spec: `docs/specs/provider-issue-pr-intake.md`

## Strategy

Implement this as a lightweight Forge workflow documentation change, not as code or a provider framework. First teach the central resume/routing path to treat issue and PR references as context intake. Then make the common direct-entry Forge skills do the same when a user starts directly with `fix issue #1`, `write a spec from issue #2`, or `review PR #5`. Finally add the provider-comment confirmation policy, bump Forge package metadata because plugin files changed, and validate with targeted text checks plus manual prompt scenarios.

## Slices

### 1. Teach central routing to treat issue/PR references as context intake

Status: completed

Outcome:
- `forge-next` and its routing/context guidance recognize issue and PR references as useful context when choosing the next skill.
- Full URLs are treated as authoritative provider/repository context.
- Shorthand references such as `#2` are resolved relative to the current Git repository when remotes are unambiguous.
- Ambiguous remotes, missing repository context, unavailable CLIs, or authentication blockers lead to a clear ask instead of guessed content.

Acceptance criteria covered:
- Given a full issue URL, the agent uses that URL's provider and repository even if the current repository remote is different.
- Given a shorthand reference outside a Git repository, without remotes, or with ambiguous remotes, the agent asks for the repository or full URL instead of guessing.
- Given a missing or unauthenticated provider CLI, the agent reports the concrete blocker and does not invent issue or PR content.
- The first implementation does not add hard-coded provider adapters, provider registries, or provider-specific command tables.

Likely files or modules:
- `plugins/forge/skills/forge-next/SKILL.md`
- `plugins/forge/skills/forge-next/references/context-checklist.md`
- `plugins/forge/skills/forge-next/references/routing.md`
- `plugins/forge/README.md` if the general Forge principles need one concise provider-intake note.

Test strategy:
- Portfolio fit: documentation/skill-behavior regression, not product code.
- Layer: skill instruction and routing documentation.
- Seam: manual prompt dry-runs against the skill text.
- Regression needed: verify existing non-provider routing still reads normally.
- Contract/property/specialized test needed: none.
- Testcontainers or real dependency needed: none for this slice.
- CI tier: local targeted checks only.

Validation:
- Inspect the changed routing text for URL-first behavior, shorthand Git-remote behavior, and ask-on-ambiguity behavior.
- Search the changed files to confirm they do not add hard-coded provider command tables or provider adapters.
- Manually walk through `check issue #2 and write a spec` and `review PR #5` from `forge-next` routing without executing provider mutations.

Dependencies:
- Ready spec: `docs/specs/provider-issue-pr-intake.md`.

Risks:
- If the guidance only lives in `forge-next`, direct skill invocations may still miss issue/PR context; slice 2 covers that.
- Too much provider detail could make the public skill noisy.

Stop conditions:
- Stop if the routing behavior requires a provider-specific decision not present in the spec.
- Stop if implementing the routing note would require a new provider adapter, provider registry, or maintained command list.

### 2. Add direct-entry issue and PR intake to common Forge task skills

Status: completed

Outcome:
- Common task skills know that issue and PR references in the user prompt should be fetched as context before normal Forge work proceeds.
- Issue references can feed idea, spec, plan, fix, build, test, review, and status-relevant work without creating a separate issue-only lifecycle.
- PR references can feed review, summary, continuation from feedback, implementation follow-up, and status-relevant work without creating `docs/reviews/` by default.
- Provider CLI usage remains agent-discovered through remotes, URLs, CLI docs, `--help`, and command output.

Acceptance criteria covered:
- Given a prompt like `check issue #2 and write a spec` in a repository with an unambiguous provider remote, the agent resolves `#2`, fetches the issue through the provider CLI, creates or updates the appropriate `docs/specs/...` artifact, and asks before posting any provider comment.
- Given `fix bug in issue #1`, the agent fetches the issue, routes to the bug-fix workflow when the issue is actionable, and asks for missing context or creates requirements first when the issue is too vague.
- Given `review PR #5`, the agent resolves the PR, fetches relevant PR context and diff information through provider CLI tooling, routes to review behavior, and asks before posting provider feedback.
- Any generated spec, plan, idea note, status update, or other durable Forge output is written under local `docs/` according to existing conventions.
- PR support does not create `docs/reviews/` by default.

Likely files or modules:
- `plugins/forge/skills/forge-idea/SKILL.md`
- `plugins/forge/skills/forge-spec/SKILL.md`
- `plugins/forge/skills/forge-plan/SKILL.md`
- `plugins/forge/skills/forge-fix/SKILL.md`
- `plugins/forge/skills/forge-build/SKILL.md`
- `plugins/forge/skills/forge-test/SKILL.md`
- `plugins/forge/skills/forge-review/SKILL.md`
- `plugins/forge/skills/forge-status/SKILL.md` only if status-specific issue/PR guidance is needed.

Test strategy:
- Portfolio fit: documentation/skill-behavior regression.
- Layer: public skill procedures and constraints.
- Seam: manual prompt dry-runs for direct skill entrypoints.
- Regression needed: verify existing skill responsibilities stay concise and one-purpose.
- Contract/property/specialized test needed: none.
- Testcontainers or real dependency needed: none for this slice.
- CI tier: local targeted checks only.

Validation:
- Inspect each changed task skill to confirm provider references are treated as context intake before normal work, not as a new workflow.
- Confirm the instructions still route vague issues back to `forge-spec` or the user rather than inventing behavior.
- Confirm no changed skill says to create `docs/reviews/` by default.

Dependencies:
- Slice 1 should establish central routing language first.

Risks:
- Repeating too much text across skills can make the skill pack harder to maintain.
- Relying on an external shared reference can make individual skills less portable if the harness only loads a single skill directory.

Stop conditions:
- Stop if direct-entry guidance needs a new public skill, provider framework, or non-portable cross-skill dependency to remain understandable.
- Stop if a direct-entry behavior conflicts with an existing skill's single responsibility.

### 3. Add provider-comment confirmation and remote-visible artifact policy

Status: completed

Outcome:
- Skills that may produce provider-facing updates clearly treat provider comments as external mutations that require an ask/confirm step.
- The ask choices cover skipping provider writes, posting a new comment, updating an existing comment when feasible, posting a summary, and posting the full artifact.
- Provider comments do not present local-only artifact paths as if they are available on the remote branch or provider surface.

Acceptance criteria covered:
- Provider comments are never created or updated unless the user confirms through the ask/confirm step.
- The provider comment ask step includes choices for no provider comment, summarized artifact, full artifact, and update versus new comment when update is feasible.
- Provider comments include artifact paths only when the files are expected to be visible in the relevant remote branch or provider context; local-only artifacts are not presented as remote-accessible paths.
- The first implementation does not add hard-coded provider adapters, provider registries, or provider-specific command tables.

Likely files or modules:
- `plugins/forge/skills/forge-idea/SKILL.md`
- `plugins/forge/skills/forge-spec/SKILL.md`
- `plugins/forge/skills/forge-plan/SKILL.md`
- `plugins/forge/skills/forge-fix/SKILL.md`
- `plugins/forge/skills/forge-build/SKILL.md`
- `plugins/forge/skills/forge-review/SKILL.md`
- `plugins/forge/skills/forge-status/SKILL.md` if status output can be mirrored to provider comments.
- Any per-skill `references/` file only if public `SKILL.md` text would otherwise become too long.

Test strategy:
- Portfolio fit: documentation/skill-behavior regression with security/privacy emphasis.
- Layer: skill constraints and output behavior.
- Seam: manual prompt dry-runs for post-work comment decisions.
- Regression needed: provider writes remain opt-in; local docs remain canonical.
- Contract/property/specialized test needed: none.
- Testcontainers or real dependency needed: none for this slice.
- CI tier: local targeted checks only.

Validation:
- Inspect changed files for explicit ask/confirm requirements before provider comments.
- Confirm comment choices include skip, summary, full artifact, and update/new when feasible.
- Confirm remote-visible path wording is present where comment output is described.
- Confirm no provider write is described as automatic.

Dependencies:
- Slices 1 and 2 should identify where provider comments can arise.

Risks:
- The ask tool name differs by harness; wording must allow structured ask/confirm when available and chat fallback otherwise.
- Remote branch visibility can be hard to prove automatically, so the instruction must avoid overclaiming.

Stop conditions:
- Stop if confirming provider comments would require hidden credentials, provider-specific mutation code, or commands not requested by the user.

### 4. Sync package metadata and validate the workflow documentation

Status: completed

Outcome:
- Forge plugin manifests are bumped consistently after skill/package documentation changes.
- The plan and status reflect the implementation state.
- Targeted validation confirms the implementation stayed lightweight and did not add provider adapters or default PR review artifacts.

Acceptance criteria covered:
- The first implementation does not add hard-coded provider adapters, provider registries, or provider-specific command tables.
- PR support does not create `docs/reviews/` by default.
- Existing Forge routing behavior for prompts without issue or PR references remains understandable.

Likely files or modules:
- `plugins/forge/.claude-plugin/plugin.json`
- `plugins/forge/.codex-plugin/plugin.json`
- `docs/plans/provider-issue-pr-intake.md`
- `docs/specs/provider-issue-pr-intake.md`
- `docs/status.md`
- Any other manifest discovered during implementation that declares the Forge plugin version.

Test strategy:
- Portfolio fit: release/package metadata and documentation regression checks.
- Layer: manifests, docs, and final skill text.
- Seam: file inspection and targeted search.
- Regression needed: manifest version consistency and no accidental new artifact conventions.
- Contract/property/specialized test needed: none.
- Testcontainers or real dependency needed: optional manual `gh` smoke test only if a safe real repository and authenticated CLI are available.
- CI tier: local checks.

Validation:
- Confirm all Forge plugin manifests that declare a version have the same bumped version.
- Run `git diff --check`.
- Search changed Forge skill files for hard-coded provider command tables or provider adapter language.
- Search for `docs/reviews` to confirm it is not introduced as a default artifact location.
- Manually review final skill text against the spec acceptance criteria.

Dependencies:
- Slices 1 through 3 should be complete.

Risks:
- Missing a manifest would violate the repository versioning rule.
- Text search may find allowed mentions of provider names or `docs/reviews/` in non-default/out-of-scope wording; validation should distinguish allowed exclusions from implemented behavior.

Stop conditions:
- Stop if a manifest declaring the Forge plugin version is discovered and cannot be updated consistently.
- Stop if validation finds provider-specific command tables or default PR review artifacts added by earlier slices.

## Plan-level risks

- Skill instructions are the product here; overly broad text can reduce activation quality more than it helps.
- Direct-entry support may require concise repeated wording across several skills because individual skills should remain portable and understandable when loaded alone.
- Provider CLI behavior varies. The implementation should document how agents learn from CLI docs/help and failures, not guarantee universal provider support.
- Provider comments mutate external systems and may expose private context; confirmation and remote-visible path wording are safety-critical.

## Checkpoints

- Before changing public API: confirm no new skill names, commands, provider adapters, or artifact paths are needed.
- Before touching data migrations: not applicable.
- Before declaring done: confirm manifest versions, `git diff --check`, no default `docs/reviews/`, no provider adapter tables, provider comment ask behavior, and manual issue/PR prompt walkthroughs.

## Links

- Status: `docs/status.md`
- Spec: `docs/specs/provider-issue-pr-intake.md`
