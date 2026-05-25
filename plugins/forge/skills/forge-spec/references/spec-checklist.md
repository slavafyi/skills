# Spec checklist

Use this checklist to make a spec useful and safe to plan from.

## Required clarity

- What problem or goal is being addressed?
- Who or what uses the changed behavior?
- What is in scope?
- What is explicitly out of scope?
- What current behavior changes?
- What behavior must stay the same?
- What are the acceptance criteria?
- How can the change be validated?

## Project context

- Does `docs/status.md` name this as the current focus?
- Is there an idea note that should be linked?
- Are there existing specs that overlap or conflict?
- Are there ADRs that constrain the design?
- Are there local project skills that affect implementation style?
- Are there existing tests, commands, or examples to reuse later?

## Acceptance criteria rules

Acceptance criteria should be:

- observable from the outside;
- specific enough to test;
- written in project vocabulary;
- independent where possible;
- explicit about important edge cases;
- explicit about failure behavior.

Prefer:

```md
- When a user does X, the system does Y.
- Given condition A, when event B happens, result C is visible.
- The command fails with a clear message when input is invalid.
```

Avoid:

```md
- Implement the helper.
- Make the code clean.
- Add a service layer.
- Handle all edge cases.
```

## Edge-case rule

Do not push unresolved edge cases into implementation.

When an edge case changes behavior, safety, data shape, architecture, or user expectations:

1. stop;
2. name the ambiguity;
3. present the realistic options;
4. ask the user or record the open question;
5. update the spec after the decision.

A build-time special case is acceptable only when it directly implements a specified behavior.

## Ready for `forge-plan`

A spec is ready for planning when:

- scope and non-goals are clear;
- acceptance criteria are testable;
- important edge cases are either specified or explicitly open;
- known architecture constraints are linked;
- unresolved questions do not block slicing.
