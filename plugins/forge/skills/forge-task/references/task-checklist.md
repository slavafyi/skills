# Task checklist

Read enough context to answer each relevant item. Omit sections that do not
matter instead of filling them with guesses.

## Source

- What exactly did the user ask for?
- Is there an issue, PR, document, discussion, or acceptance-test source?
- Are linked sources accessible and current?
- Does repository state contradict the task description?

Use available provider tooling for external references. Resolve shorthand such
as `#42` from repository context only when unambiguous. Never invent blocked
content or modify the external source.

## Behavior

- Who or what is affected?
- What happens now, based on evidence?
- What observable outcome should change?
- Which behavior must remain unchanged?

## Boundaries

- In scope
- Explicit or strongly evidenced non-goals
- Compatibility, security, data, performance, and platform constraints
- Relevant repository conventions and accepted architectural decisions

## Completion

Derive acceptance criteria only from the request and established project
behavior. Prefer observable outcomes over implementation details.

Identify the smallest credible validation signal, such as a focused test,
reproduction, typecheck, build, or manual runtime check. Do not design a full
test strategy unless the task requires one.

## Readiness

Choose one result:

- **Ready for direct implementation:** behavior, boundaries, and validation are
  clear enough to proceed without inventing requirements.
- **Needs a user decision:** two or more materially different outcomes remain
  reasonable.
- **Needs more investigation:** accessible repository evidence is still
  insufficient.
- **Needs an implementation plan:** requirements are clear, but sequencing,
  dependencies, or risk make direct implementation unsafe.

## Example

For "Read issue #42 and tell me whether it is ready to implement," read the
issue and relevant discussion, inspect the named code and tests, and compare the
request with current behavior. If duplicate identifiers could reasonably be
rejected or merged and the issue does not choose, report that single decision
as blocking. Do not choose a behavior or start coding.
