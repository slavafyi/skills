---
name: forge-idea
description: Explore and pressure-test a raw product, feature, refactor, or technical idea before it becomes requirements. Use when the user is brainstorming, asks whether an idea makes sense, wants alternatives, or describes a vague direction.
---

# forge-idea

Clarify a raw idea. Do not write a spec, plan, or code.

## Use when

- The user is brainstorming a product, feature, refactor, or technical direction.
- The problem or desired outcome is still fuzzy and should not become a spec yet.
- Options, tradeoffs, assumptions, or a durable idea note need to be explored.
- The user says "I have an idea", "What do you think about this?", "Let's explore this", "Does this make sense?", or asks to explore an issue/PR.

## Procedure

1. Read only the context needed to understand the idea: `docs/status.md`, relevant ideas/specs/ADRs, and local skills when they clearly matter.
2. If the prompt includes an issue or PR reference, fetch it as context first; ask for a URL, setup, or pasted context when resolution or provider access is blocked.
3. Restate the problem, expected outcome, likely user or stakeholder, facts, and assumptions.
4. Compare realistic options using `references/idea-checklist.md`. Include the smallest useful change or "do nothing" option when useful.
5. Decide the next step: keep as a short answer, save an idea note, route to `forge-spec`, route to `forge-adr`, or route to `forge-fix`.
6. Persist only durable ideas in `docs/ideas/<slug>.md` using `references/idea-note-template.md`; create `docs/ideas/` only as part of writing the idea note.

## Output

```md
Idea:
- ...

Options:
- ...

Recommendation:
- ...

Unknowns:
- ...

Next action:
- ...
```

## Constraints

- Do not implement code.
- Do not promote vague ideas directly to `forge-build`.
- Do not create a document for every brainstorm.
- Do not create empty artifact directories in advance.
- Do not hide assumptions inside confident recommendations.

## References

- `references/idea-checklist.md`
- `references/idea-note-template.md`
