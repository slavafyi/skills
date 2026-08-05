# Task checklist

Read enough context to answer each relevant item. Omit sections that do not
matter instead of filling them with guesses.

## Source

- What exactly did the user ask for?
- Is relevant context already present in repository documentation or tests?
- Does repository state contradict the task description?

If the source is an external tracker identifier or URL, use `forge-ticket`
instead.

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

For "Clarify the requested CSV export change before coding," inspect the task
text, current export behavior, and focused tests. If duplicate rows could
reasonably be preserved or collapsed and the request does not choose, report
that single decision as blocking. Do not choose a behavior or start coding.
