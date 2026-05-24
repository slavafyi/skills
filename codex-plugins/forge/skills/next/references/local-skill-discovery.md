# Local skill discovery

Project-local skills are durable instructions specific to the current repository.

## Path rules

Claude-only project:

```text
.claude/skills/
```

Default / non-Claude project:

```text
.agents/skills/
```

Multi-agent / agent-agnostic project:

```text
.agents/skills/
.claude/skills/    # symlinks to .agents/skills/*
```

## Discovery order

1. If `.agents/skills/` exists, read its skill names and descriptions.
2. If `.claude/skills/` exists:
   - If entries are symlinks to `.agents/skills/`, treat `.agents/skills/` as the source.
   - If `.agents/skills/` does not exist, read `.claude/skills/` as Claude-only project skills.
   - If both exist and they are not symlinked, read both and watch for conflicting instructions.
3. If no local skill directory exists, continue without local skills.

## How to use local skills

Do not load every local skill in full by default.

First read each `SKILL.md` frontmatter:

- `name`
- `description`

Load the full skill only when its description matches the current task.
