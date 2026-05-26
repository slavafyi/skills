# Agent instructions

This repository may contain multiple skill plugins. Do not assume there is only one plugin or one global skill source.

Use `docs/status.md` as the project continuation point when the next action is unclear.

When editing a plugin:

- keep changes inside `plugins/<plugin>/` unless root marketplace metadata needs an update;
- keep public `SKILL.md` files concise and responsible for one thing;
- put detailed procedures, templates, and checklists in the skill's `references/` directory;
- keep skills harness-agnostic, portable, and safe to use across coding agents;
- make frontmatter `name` match the skill directory exactly;
- do not add secrets, credentials, personal tokens, or machine-specific paths.

## Versioning rule

When a plugin package changes, bump that plugin's version in every manifest that declares it. Keep all manifests for the same plugin in sync, including skill and documentation-only changes.
