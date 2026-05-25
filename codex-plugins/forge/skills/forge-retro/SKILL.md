---
name: forge-retro
description: Run a session retro after user feedback or correction. Use when the user asks to preserve lessons from the current session, decide whether to update status/specs/ADR, or create/update project-local skills.
---

# forge-retro

Extract durable lessons from the current session and save them in the right place.

This skill turns user corrections into better future behavior without dumping rules into `AGENTS.md`, `CLAUDE.md` or project docs.

## Use when

Use this skill when the user says things like:

- "Go retro";
- "Do a retrospective";
- "Keep this in mind for the project";
- "Take note of this lesson";
- "Update your local skills";
- "Do it this way next time";
- "Don't do that again in this project".

## Procedure

1. Review the session.
   - Identify user corrections, rejected approaches, accepted fixes, and repeated preferences.
   - Use only available conversation and project context.
   - Do not invent lessons.

2. Extract candidate lessons.
   - Each lesson must be durable, reusable, and specific.
   - Ignore one-off edits, temporary preferences, and ordinary task details.

3. Route each lesson.
   - Use `references/artifact-routing.md`.
   - Possible targets:
     - `docs/status.md`
     - `docs/specs/<slug>.md`
     - `docs/adr/<id>-<slug>.md`
     - project-local skill
     - suggested Forge core skill change
     - no persistence

4. Create or update project-local skills when appropriate.
   - Use `references/local-skill-targets.md` to choose the path.
   - Use `references/local-skill-authoring.md` to write the skill.
   - Use `references/local-skill-template.md` as the base.
   - Prefer updating an existing local skill over creating a duplicate.

5. Update project artifacts.
   - Status updates go through the `forge-status` format.
   - Spec updates should preserve requirements and acceptance criteria.
   - ADRs should stay narrow and architectural.

6. Report the retro.
   - Summarize lessons found.
   - List artifacts created or updated.
   - List ignored lessons and why, when useful.
   - List suggested Forge core changes, if any.

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
- Do not add long process rules to `AGENTS.md` or `CLAUDE.md`.
- Do not modify installed Forge skills from an ordinary project.
- Do not create ADRs for style preferences unless they are architectural.
- Do not preserve everything; filtering is the point.

## References

- `references/retro-checklist.md`
- `references/artifact-routing.md`
- `references/local-skill-targets.md`
- `references/local-skill-authoring.md`
- `references/local-skill-template.md`
