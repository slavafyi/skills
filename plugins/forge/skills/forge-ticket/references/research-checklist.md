# Research checklist

Use every relevant source category supported by the current environment. Record
what was searched even when no useful result was found.

## Related work items

- Read every explicitly linked parent, child, blocker, blocked-by, duplicate,
  and related work item.
- For each explicitly linked item, inspect its description, resolution,
  attachments, direct links, comments, replies, and complete pagination.
- Search the tracker using the ticket identifier, title, feature, component,
  labels, service, affected user flow, error text, and distinctive terms.
- Inspect candidate historical tasks far enough to establish relevance, then
  fully read every material match.
- Capture prior decisions, rejected approaches, implementations, regressions,
  and unresolved follow-ups.
- Record the queries and filters used. Do not describe search-based discovery
  as complete coverage of the tracker.

## Internal knowledge

Search every available internal documentation system, including Confluence,
ClickUp Docs, Notion, internal search services, ADRs, RFCs, specifications,
runbooks, and repository documentation.

Search by ticket identifier, title, feature, component, service, errors, and
technical terms discovered during research. Follow direct references that add
task context and record inaccessible sources.

## Team discussions

Discover available Slack, Teams, and equivalent messaging integrations. Search
accessible workspaces, teams, and channels by ticket identifier, URL, title,
feature, error text, service, and relevant participant names.

Read each material matching conversation, its full thread, all replies, shared
attachments, and direct links. Exhaust result and thread pagination where the
provider supports it. Record the channels and query scope searched without
sending messages or joining conversations.

## Code hosts and repositories

Treat GitHub and GitLab issues as work items covered by this skill. For material
issues, pull requests, and merge requests, read descriptions, comments, review
threads, linked work, checks, and the relevant change history.

Inspect the current repository and other accessible relevant repositories for
current behavior, tests, prior implementations, commits, blame, release notes,
and configuration. A linked PR or MR is evidence for task research; route a
request for an actual code review to the review workflow instead.

## Public technical research

When the task has a public technical dimension, search:

- official documentation, specifications, release notes, and migration guides;
- public issue trackers, pull requests, and maintainer discussions;
- language, framework, library, platform, browser, and operating-system bugs;
- reputable technical communities and focused engineering discussions.

Prefer primary sources. Verify consequential claims with more than one source
when practical. Search with sanitized technical terms only; never submit
private task text, internal identifiers, customer data, private URLs, or secrets
to a public service.

If no meaningful public technical angle exists, mark this category not
applicable and explain why instead of performing unrelated searches.

## Evidence quality

For each material finding, preserve a stable URL or source identifier when
available. Distinguish direct evidence from inference and note source dates when
staleness could change the conclusion.

Resolve contradictions when possible. Otherwise report both claims, their
sources, and the decision or evidence still needed.
