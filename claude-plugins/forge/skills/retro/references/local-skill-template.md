# Local skill template

Use this template for new project-local skills.

```md
---
name: project-skill-name
description: Use this skill when [specific trigger]. It helps agents [specific project-local behavior].
---

# project-skill-name

Use this skill when [trigger].

## Rule

[State the durable project-specific rule.]

## Procedure

1. [Concrete step.]
2. [Concrete step.]
3. [Concrete step.]

## Prefer

- [Preferred pattern.]

## Avoid

- [Anti-pattern.]

## Check before finishing

- [Validation check.]
- [Documentation/status check if relevant.]
```

## Example

```md
---
name: project-code-organization
description: Use this skill when adding or refactoring feature code in this repository. It keeps feature-local logic local unless a real architectural boundary justifies extraction.
---

# project-code-organization

Use this skill when adding or refactoring feature code.

## Rule

Prefer keeping feature-local logic near the feature module unless reuse, domain pressure, or an existing architectural boundary justifies extraction.

## Procedure

1. Look for the nearest feature module.
2. Check whether the logic is used in more than one place.
3. Check whether the current architecture already has a boundary for this logic.
4. Keep the implementation local when extraction would only add ceremony.

## Prefer

- Local functions inside or near the feature module.
- Existing project boundaries.
- Small changes that match surrounding code.

## Avoid

- New service, manager, repository, or helper layers without clear pressure.
- Abstractions introduced only to make code look organized.
- Moving code away from the feature before reuse exists.

## Check before finishing

- The implementation matches nearby code.
- No new abstraction was added without justification.
- The diff is smaller and clearer than the extracted alternative.
```
