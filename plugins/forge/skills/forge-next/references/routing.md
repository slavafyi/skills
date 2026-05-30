# Routing

Use this guide after reading project context.

## Missing Forge artifacts

If `docs/status.md` is missing:

- route to `forge-init`;
- do not create a large documentation tree.

## Existing uncommitted changes

If there are uncommitted changes:

- understand whether they are intentional;
- compare them to the active status/spec/plan;
- route to `forge-review` when the diff needs inspection;
- route to `forge-status` when work is complete but status is stale;
- ask before modifying when changes look accidental.

## Issue or PR reference intake

If the user prompt includes an issue or PR URL or shorthand reference:

- resolve and read the referenced provider context before choosing the Forge skill;
- treat a full URL as the authoritative provider and repository, regardless of the current repository remote;
- resolve shorthand references such as `#2`, `issue #2`, `PR #5`, or `pull request #5` relative to the current Git repository only when remotes make the provider and repository unambiguous;
- ask for a full URL or repository when shorthand resolution is outside a Git repository, has no usable remote, or has ambiguous remotes;
- use provider CLI documentation, `--help`, and command output to determine how to fetch context, without adding provider adapters, registries, or provider-specific command tables;
- report a concrete blocker when the needed provider CLI is missing, unauthenticated, or inaccessible, and ask for setup or pasted context instead of inventing issue or PR details;
- fetch only the minimum useful context needed for routing, such as title, body, state, URL, relevant metadata, recent discussion, changed files, or diff information when relevant.

After intake, route through the normal Forge responsibilities:

- issue context usually feeds `forge-idea`, `forge-spec`, `forge-plan`, `forge-fix`, `forge-build`, `forge-status`, or `forge-review`, depending on the user's intent and how actionable the issue is;
- PR context usually feeds `forge-review`, summary, continuation from feedback, implementation follow-up, or `forge-status` behavior;
- if provider context contradicts the user's wording, briefly state the resolved type and ask when it changes the expected route.

## Vague idea

If the user gives a raw idea and no clear requirements:

- route to `forge-idea`.

## Clear feature/change but no spec

If the goal is clear but not specified:

- route to `forge-spec`.

## Ready spec but no plan

If an active spec exists and the next implementation slice is not obvious:

- route to `forge-plan`.

## Ready plan or clear small target

If there is a ready plan with a next slice, or the user gave a small explicit code target:

- route to `forge-build`.

## Bug, failing validation, or broken behavior

If behavior is broken, validation failed, or a previous implementation exposed an error:

- route to `forge-fix` when the root cause is unknown;
- route to `forge-spec` when the issue is unspecified behavior or an edge-case design question;
- do not patch symptoms directly from `forge-next`.

## Review request or uncertain diff

If the user asks for review or the current diff needs inspection:

- route to `forge-review`.

## Important technical decision

If a durable architectural decision was made or is needed:

- route to `forge-adr`.

## User correction or process lesson

If the user corrected the agent and wants the lesson preserved:

- route to `forge-retro`.

## Nothing obvious

If several next steps are plausible:

- ask one short question;
- include the two or three likely choices.
