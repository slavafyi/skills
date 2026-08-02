# Local skill targets

## Default and multi-agent projects

Use the portable Agent Skills location:

```text
.agents/skills/<skill-name>/SKILL.md
```

If Claude also needs the skill, a project may expose a symlink rather than a
copy:

```text
.claude/skills/<skill-name> -> ../../.agents/skills/<skill-name>
```

## Claude-only projects

Use `.claude/skills/<skill-name>/SKILL.md` only when the repository is clearly
Claude-only and has no `.agents/skills/` source of truth.

## Existing layouts

- Update an existing `.agents/skills/` skill in place.
- Follow an existing `.claude/skills/` symlink to its target.
- Preserve a clear project convention.
- If both locations contain divergent real copies, do not reorganize them
  automatically; report the conflict and ask which source should remain.
