# Idea checklist

Use this checklist to decide whether an idea is worth specifying.

## Problem

- What pain, risk, or opportunity does this address?
- Who benefits from the change?
- What would be true after it works?
- What happens if nothing is done?

## Project fit

- Does it match the current focus in `docs/status.md`?
- Does it conflict with existing specs or ADRs?
- Does it reuse the project's current vocabulary and architecture?
- Is it a feature, refactor, bug fix, operational change, or architecture decision?

## Options

Compare options that are meaningfully different:

- smallest useful change;
- slightly larger long-term version;
- prototype/spike;
- do nothing;
- defer until another prerequisite exists.

For each option, consider user impact, cost, reversibility, risk, validation, and what it teaches.

## Traps

- The idea is a solution but the problem is unstated.
- The idea requires hidden product or architecture decisions.
- The idea depends on external services, credentials, migrations, or deployment access.
- The idea adds abstraction before there is pressure for abstraction.
- The idea is too broad for one spec or build slice.

## Ready for `forge-spec`

An idea is ready for `forge-spec` when:

- the problem is clear;
- the desired outcome is clear;
- major non-goals are known;
- important tradeoffs have an initial answer;
- acceptance criteria can be written without inventing too much;
- unresolved questions are specific.
