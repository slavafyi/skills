# Spec: Provider issue and PR intake

Created: 2026-05-31
Status: ready

## Goal

Forge workflows should be able to start from repository issue or pull request references in normal user prompts. When a user mentions an issue or PR by URL or shorthand reference, the agent should resolve the provider from the URL or repository remotes, use the provider's CLI tooling to fetch context, route the work to the appropriate Forge workflow, keep local `docs/` artifacts canonical, and ask before writing provider comments.

## Background

The approved idea is to make real project issues and PRs useful as Forge inputs without building a provider framework too early. The first version should rely on agent judgment, repository remotes, provider URLs, installed CLI tools, CLI documentation, and `--help` output rather than hard-coded provider adapters or command lists.

Forge project artifacts remain the durable source of truth. Provider issues and PRs are collaboration surfaces: useful for intake, review context, and optional notifications, but not the only place where specs, plans, or other durable project context should live.

## Scope

### In scope

- Detecting issue and PR references in user prompts, including full provider URLs and shorthand references such as `#2`, `issue #2`, `PR #5`, and `pull request #5`.
- Resolving the provider and repository from an explicit URL or from the current Git repository remotes.
- Using provider CLI tooling, CLI docs, built-in help, and command output to learn how to fetch issue or PR context.
- Reading enough issue or PR context to route and perform the requested Forge work.
- Routing issue references into existing Forge workflows such as idea, spec, plan, fix, build, status, or review as appropriate to the user's intent.
- Routing PR references into review, summary, continuation from feedback, implementation follow-up, status, or other relevant Forge workflows as appropriate to the user's intent.
- Writing or updating local `docs/` artifacts when the routed Forge workflow normally creates or changes them.
- Asking the user before creating or updating provider comments.
- Offering comment form choices such as no provider comment, new comment, update an existing comment when feasible, summarized artifact, or full artifact.

### Out of scope

- Hard-coded provider adapters, provider registries, or maintained provider-specific command tables.
- Guaranteeing support for every provider CLI.
- Installing, authenticating, or configuring provider CLI tools automatically.
- Replacing local Forge artifacts with provider comments.
- Automatically writing provider comments without user confirmation.
- Creating `docs/reviews/` as a default PR-review artifact location.
- Inline PR review comments, code suggestions, or formal provider review submission flows unless a later spec adds them.
- Creating issues, creating PRs, managing labels, or changing provider metadata beyond optional confirmed comments.

## Requirements

- When a prompt contains an issue or PR URL, the agent must treat the URL as the authoritative provider and repository reference.
- When a prompt contains a shorthand reference such as `#2`, the agent must resolve it relative to the current Git repository instead of guessing a provider globally.
- When resolving shorthand references, the agent should inspect Git remotes and prefer the obvious current project remote when it is unambiguous.
- If the repository or provider cannot be inferred from the prompt and remotes, the agent must ask the user for a URL or repository.
- The agent must not introduce hard-coded provider adapters or provider-specific command lists for this workflow.
- The agent should use the relevant provider CLI, CLI docs, `--help` output, and command feedback to determine how to fetch issue or PR data.
- If the required provider CLI is unavailable, unauthenticated, or blocked, the agent must report the blocker and ask for either CLI setup, a pasted issue/PR summary, or another source of context.
- The agent must resolve whether a reference is an issue, a PR, or ambiguous using provider context where possible, not only by the user's wording.
- The agent should fetch the minimum useful context needed for the requested work:
  - for issues: title, body, state, URL, relevant labels or metadata when available, and recent discussion when needed;
  - for PRs: title, body, state, URL, relevant discussion, changed files or diff when needed, and review feedback when needed.
- The agent must avoid unbounded history fetching; if old comments or full discussion history might matter, it should ask or explain the limited context used.
- The agent must route fetched context through normal Forge intent matching rather than creating a separate issue-only workflow.
- If a routed workflow creates durable output, the output must be stored in local `docs/` artifacts using existing Forge conventions.
- Provider comments must be treated as optional mirrors or collaboration updates, not as the canonical artifact.
- Before creating or updating a provider comment, the agent must use the available structured ask/confirm tool when possible; otherwise it must ask in chat and wait.
- The ask step for provider comments must include meaningful choices, including whether to skip provider writing and whether to post a summarized or full artifact.
- If updating an existing provider comment is feasible, the ask step should offer update versus new comment; if it is not feasible, the agent should say so and offer a new comment or no comment.
- Provider comment content should include local artifact paths only when those paths are expected to exist in the remote branch or provider context visible to comment readers.
- If an artifact exists only in the local working tree, the agent must not imply that the path is already available remotely; it should either omit the path, mark it as local/unpushed, or ask the user how to reference it.
- The agent must not include secrets, credentials, private tokens, or unrelated local environment details in local artifacts or provider comments.
- If provider context contradicts the user's wording, the agent must briefly state the mismatch and ask when it changes routing or expected behavior.

## Acceptance criteria

- [ ] Given a prompt like `check issue #2 and write a spec` in a repository with an unambiguous provider remote, the agent resolves `#2`, fetches the issue through the provider CLI, creates or updates the appropriate `docs/specs/...` artifact, and asks before posting any provider comment.
- [ ] Given a full issue URL, the agent uses that URL's provider and repository even if the current repository remote is different.
- [ ] Given `fix bug in issue #1`, the agent fetches the issue, routes to the bug-fix workflow when the issue is actionable, and asks for missing context or creates requirements first when the issue is too vague.
- [ ] Given `review PR #5`, the agent resolves the PR, fetches relevant PR context and diff information through provider CLI tooling, routes to review behavior, and asks before posting provider feedback.
- [ ] Given a shorthand reference outside a Git repository, without remotes, or with ambiguous remotes, the agent asks for the repository or full URL instead of guessing.
- [ ] Given a missing or unauthenticated provider CLI, the agent reports the concrete blocker and does not invent issue or PR content.
- [ ] Any generated spec, plan, idea note, status update, or other durable Forge output is written under local `docs/` according to existing conventions.
- [ ] Provider comments are never created or updated unless the user confirms through the ask/confirm step.
- [ ] The provider comment ask step includes choices for no provider comment, summarized artifact, full artifact, and update versus new comment when update is feasible.
- [ ] Provider comments include artifact paths only when the files are expected to be visible in the relevant remote branch or provider context; local-only artifacts are not presented as remote-accessible paths.
- [ ] The first implementation does not add hard-coded provider adapters, provider registries, or provider-specific command tables.
- [ ] PR support does not create `docs/reviews/` by default.

## Behavior details

### Reference resolution

- Full issue or PR URLs are self-contained and should not require current-repository inference.
- Shorthand references such as `#2` require a current repository context. The agent should inspect Git remotes and infer the provider from the relevant remote URL.
- If the user says `issue #2` but the provider resolves `#2` as a PR, or says `PR #2` but it resolves as an issue, the agent should state the resolved type. If the user's intended workflow still makes sense, continue; if routing changes, ask.
- If the prompt includes multiple issue or PR references, the agent should use all of them only when the user clearly asked for that. Otherwise, ask which reference is primary.

### Routing

- Issue context is mainly intake for ideas, specs, plans, fixes, builds, and status updates.
- PR context is mainly intake for review, summary, continuation from feedback, implementation follow-up, and status updates.
- The workflow should reuse existing Forge skill responsibilities. It should not create a separate provider-specific lifecycle.

### Provider comments

- Reading provider context can be automatic when the user asks the agent to inspect an issue or PR.
- Writing provider comments is external mutation and requires an ask/confirm step.
- The default recommended comment shape should be a concise summary plus links or paths to local artifacts.
- Artifact paths in provider comments should be included only when the referenced files are expected to exist remotely, such as on the PR branch or another pushed branch visible to collaborators.
- When artifacts are only local, the default comment should summarize the result without a remote path, or explicitly say that the artifact is local/unpushed if the user chooses to mention it.
- Full artifact comments should be available when the user wants the provider thread to contain the complete content.
- Updating an existing provider comment is useful to reduce noise, but should be attempted only when the agent can identify and update the previous comment safely with the provider CLI.

## Edge cases

- If the provider CLI supports URLs directly, the agent may use URL-based commands. If it only supports repository and number arguments, the agent may derive those from the URL or remote.
- If the provider CLI has incomplete output, the agent may combine multiple CLI commands, help output, or documented CLI behavior to gather context.
- If an issue or PR is private, deleted, inaccessible, or rate-limited, the agent should report the provider error and ask for another context source.
- If fetched comments are long, noisy, or numerous, the agent should summarize only the relevant parts and mention that it limited history.
- If provider discussion includes secrets or sensitive data, the agent must avoid copying them into `docs/` artifacts or provider comments.
- If a PR review reveals durable requirements or project decisions, the agent should update existing specs, plans, ADRs, or status as appropriate instead of creating `docs/reviews/` by default.
- If real-project testing exposes repeated provider-specific friction, a later spec or reference may document patterns, but this spec does not require that upfront.

## Constraints

- Existing ADRs: none known.
- Project-local skills: Forge skills in `plugins/forge/skills/` define the workflow behavior and should remain composable rather than becoming a mandatory pipeline.
- Compatibility: prompts without issue or PR references should keep existing Forge routing behavior.
- Security/privacy: provider content may be private; avoid leaking secrets or unrelated local environment details into artifacts or comments.
- Performance: avoid unbounded provider history fetching or broad provider searches when one referenced issue or PR is enough.

## Test and validation expectations

- Small/unit tests: not required unless the implementation introduces executable parsing or helper scripts.
- Component/integration/real dependency tests: if executable code is added, test shorthand and URL reference parsing without real provider network calls where practical.
- Contract/schema compatibility tests: not applicable unless provider output schemas are parsed by code.
- Property/fuzz tests: not expected.
- E2E/broad-stack tests: manually test against at least one real GitHub repository using `gh` because the first real workflow is expected to use provider CLI behavior.
- Specialized tests: not expected.
- Regression proof: verify existing Forge skill routing still works for prompts that do not mention issues or PRs.
- Manual checks:
  - `#N` issue intake in a repository with an unambiguous remote.
  - Full issue URL intake.
  - `#N` PR review intake.
  - Missing or unauthenticated provider CLI failure behavior.
  - Provider comment ask flow with skip, summary, full artifact, and update/new options where feasible.
- Out of scope: exhaustive provider testing across every issue tracker or hosting service.

## Open questions

- None blocking. Real-project testing may reveal provider-specific patterns worth documenting later.

## Links

- Status: `docs/status.md`
- Idea: `docs/ideas/provider-issue-intake.md`
- Plan: `docs/plans/provider-issue-pr-intake.md`
