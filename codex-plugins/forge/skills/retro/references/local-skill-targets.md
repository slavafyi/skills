# Local skill targets

Use this resolver when creating or updating project-local skills.

## Modes

### Claude-only

Use when the project is clearly using Claude Code only.

Signals:

- `.claude/skills/` exists and `.agents/skills/` does not;
- `.claude/` or `CLAUDE.md` exists and there is no signal of other agents;
- the user says this is a Claude-only project.

Target:

```text
.claude/skills/<skill-name>/SKILL.md
```

Do not create `.agents/skills/` in Claude-only mode.

### Default / non-Claude

Use when the project is not clearly Claude-only and not explicitly multi-agent.

Target:

```text
.agents/skills/<skill-name>/SKILL.md
```

### Multi-agent / agent-agnostic

Use when:

- the user says "agent agnostic", "multi-agent", "Claude and Codex", or similar;
- both Claude and non-Claude agents are clearly used;
- `.agents/skills/` exists and `.claude/skills/` entries are symlinks into it.

Canonical target:

```text
.agents/skills/<skill-name>/SKILL.md
```

Claude bridge:

```text
.claude/skills/<skill-name> -> ../../.agents/skills/<skill-name>
```

Use symlinks, not copies.

## Updating existing skills

1. If the skill already exists in `.claude/skills/` as a normal directory and `.agents/skills/` does not exist, update `.claude/skills/`.
2. If the skill exists in `.agents/skills/`, update `.agents/skills/`.
3. If `.claude/skills/<skill-name>` is a symlink, update the target.
4. If both directories contain different normal copies, do not reorganize automatically. Explain the conflict and ask which convention to keep.

## Creating a new skill

1. If mode is Claude-only, create it in `.claude/skills/`.
2. If mode is default/non-Claude, create it in `.agents/skills/`.
3. If mode is multi-agent, create it in `.agents/skills/` and create the Claude symlink.

## Symlink command

For multi-agent mode:

```bash
mkdir -p .agents/skills .claude/skills
ln -s ../../.agents/skills/<skill-name> .claude/skills/<skill-name>
```

If the symlink already exists and points to the right target, leave it alone.
