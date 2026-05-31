# Idea: Provider issue and PR intake for Forge workflows

Created: 2026-05-31
Status: superseded

Superseded by: `docs/ideas/lightweight-provider-issue-pr-intake.md`

## Summary

Allow Forge workflows to start from issue or pull request references in the current repository, using the repository remote or explicit URL to infer the provider and the provider's CLI tooling to fetch context. Keep the workflow lightweight: no hard-coded provider adapters yet, no provider framework, and no premature abstraction. Keep local `docs/` artifacts canonical, and use provider comments only as optional mirrors or collaboration updates after explicit user confirmation through the ask tool.

## Problem or opportunity

- Users often describe work in repository issues or pull requests before asking an agent to spec, plan, review, or implement it.
- Agents work better when durable context is stored in versioned local project docs instead of only in provider comments.
- A workflow like `check issue #2 and give me a spec` should fetch the issue, route to the right Forge skill, and preserve the result in `docs/`.
- A workflow like `review PR #5` should fetch the pull request, route to the right review or continuation workflow, and ask before posting provider comments.
- Provider writes, such as GitHub comments, should not happen implicitly; the agent should ask first.

## Options considered

### Option A: Lightweight provider CLI workflow

- Pros:
  - Avoids hard-coded provider adapters while the workflow is still being learned.
  - Lets agents inspect remotes, URLs, CLI docs, and `--help` output to decide how to fetch issues or PRs.
  - Supports real-project testing quickly for both issues and PRs.
- Cons:
  - Behavior may vary by provider CLI and agent capability.
  - Ambiguous references may require asking the user.
- Validation:
  - In a real repository, mention an issue or PR by `#N` or URL; verify the agent resolves the provider, uses the relevant CLI tooling, writes or updates the requested `docs/` artifact when appropriate, and asks before commenting.

### Option B: Hard-coded provider adapters

- Pros:
  - Could make behavior more deterministic later.
  - Could document provider-specific command patterns once the workflow is proven.
- Cons:
  - Overengineering at the current stage.
  - Freezes assumptions before the workflow has been tested on real projects.
  - Adds maintenance burden for provider-specific behavior.
- Validation:
  - Defer until the lightweight workflow repeatedly fails for provider-specific reasons.

### Option C: Provider comments as primary output

- Pros:
  - Keeps discussion visible where collaborators already work.
  - Useful for PR reviews and status updates.
- Cons:
  - Provider comments are less convenient for future agents than repository docs.
  - Comments can drift from local project state.
  - Comment-heavy workflows can create noise.
- Validation:
  - Confirm future sessions can resume from the provider without local docs; this is likely weaker than `docs/`.

## Current recommendation

- Start with a lightweight workflow that lets agents detect the provider from the remote or URL and use the associated provider CLI.
- Agents should use CLI docs, built-in help, and provider CLI output to learn how to resolve issue/PR references such as `#2` or full URLs.
- Do not introduce hard-coded provider adapters or provider-specific command lists yet.
- Treat issue references as context intake for Forge routing:
  - `idea` requests route to `forge-idea`.
  - `spec` requests route to `forge-spec`.
  - `plan` requests route to `forge-plan`.
  - bug-fix requests route to `forge-fix`, with spec/plan first if the issue is too vague.
- Include PR references in the same first slice for review, summary, continuation from feedback, and optional confirmed comments.
- Keep generated artifacts in `docs/` as the source of truth.
- Use the ask tool before writing provider comments, including whether to post a new comment, update a previous comment, post the full artifact, or post a summarized version.
- Default provider comments to a short summary. Include artifact paths only when they are expected to be visible in the relevant remote branch or provider context; for local-only artifacts, omit paths, mark them local/unpushed, or ask how to reference them.
- Do not add `docs/reviews/` initially; only create durable review artifacts later if PR reviews reveal context future agents need.

## Unknowns

- Exact ask options and wording for provider comment writes.
- Whether the agent should prefer updating a previous Forge-authored provider comment or creating a new comment.
- How much issue or PR comment history to fetch by default.
- How to resolve shorthand references like `#2` when multiple remotes or forks exist.
- Which provider-specific patterns deserve documentation after real-project testing.

## Links

- Status: `docs/status.md`
- Spec: `docs/specs/provider-issue-pr-intake.md`
- ADR: none yet
