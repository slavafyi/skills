---
name: forge-retro
description: Run a session retro after user feedback or correction. Use when the user asks to preserve lessons from the current session, decide whether to update status/specs/ADR, or create/update project-local skills.
---

# forge-retro

Extract durable lessons from the current session and save them in the right place.

This skill turns user corrections into better future behavior without dumping repeatable behavior rules into `AGENTS.md`, `CLAUDE.md`, or generic project docs.

Project facts, requirements, implementation plans, architectural decisions, and current handoff state still belong in the appropriate project artifacts.

## Use when

- The user corrects agent behavior and wants the lesson preserved.
- The current session produced reusable project-specific guidance.
- The user asks to update local skills, memory, status, specs, plans, or ADRs based on the conversation.
- The user says "Go retro", "Do a retrospective", "Do it this way next time", or "Don't do that again in this project".

## Procedure

1. Review the current session for durable lessons using `references/retro-checklist.md`.
2. Filter out one-off edits, temporary preferences, ordinary task details, and weak signals.
3. Route each durable lesson with `references/artifact-routing.md`.
4. Create or update project-local skills only when the lesson is repeatable agent behavior.
5. Update project artifacts only when the lesson belongs in status, spec, plan, or ADR.
6. Report lessons found, artifacts changed, skipped items, and suggested Forge core changes.

## Project-local skill rule

Use project-local skills for repeatable project-specific agent behavior.

Examples:

- code organization preferences;
- testing style;
- API patterns;
- UI implementation conventions;
- forbidden local anti-patterns;
- repository-specific review checks.

Do not create a local skill for a one-off correction.

## Constraints

- Do not create divergent copies in multi-agent mode.
- Do not add long process rules to `AGENTS.md`, `CLAUDE.md`, or generic docs.
- Do not modify installed Forge skills from an ordinary project.
- Do not create ADRs for style preferences unless they are architectural.
- Do not preserve everything; filtering is the point.

## References

- `references/retro-checklist.md`
- `references/artifact-routing.md`
- `references/local-skill-targets.md`
- `references/local-skill-authoring.md`
- `references/local-skill-template.md`
